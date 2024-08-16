const fs = require('fs');
const glob = require('glob')
const { Differ } = require('./differ')
const { CommitDiffer } = require('./commit_differ')
const { Document } = require('./document')

// pa11y plugin
//
// Previously, pa11y CI runs checked every single page, and often took
// over 20 minutes to run.
//
// This plugin checks what files were modified in the last commit (CI)
// or modified since the last commit (local development), and decides
// which files need to be checked for accessibility, based on the
// nature of the changes.
//
// A site-wide pa11y test is needed when we change something that
// affects the global configuration, like layouts or styles. However,
// we don't want to check every single page in CI, because of how long
// that takes.
//
// This produces a sample set of pages to assess accessibility broadly
// without running for 20 minutes each PR.
//
// The algorithm is:
// - If a "trigger" file is changed, start a site-wide scan.
// - Samples 3 files and the index from each collection
// - Output those files to pa11y
//
// This is pretty naive — it would be better to, say, scan pages
// that use a changed partial or layout.
//
// This scan happens in addition to, not in place of, the
// pa11yPerPage scan.
//

function changedFileSet() {
  const differ = process.env.CI ? new CommitDiffer : new Differ
  return new Set(differ.changedFiles());
}

function sitewideFileSet() {
  const sitewideFolders = ['assets', 'templates']
  const sitewideFiles = [];
  sitewideFolders.forEach((folder) => {
    sitewideFiles.push(glob.sync(`${folder}/**/*`))
  });
  return new Set(sitewideFiles.flat())
}

function intersection(setA, setB) {
  const result = new Set();
  setA.forEach((value) => {
    if (setB.has(value)) {
      result.add(value)
    }
  });
  return result
}

function doesIntersect(setA, setB) {
  return intersection(setA, setB).size > 0
}

function didSitewideFilesChange() {
  const filesDidChange = doesIntersect(changedFileSet(), sitewideFileSet())
  if (filesDidChange) {
    console.log('[pa11y] Sitewide files changed, doing sitewide sample') /* eslint-disable-line no-console */
  } else {
    console.log('[pa11y] Sitewide files did not change, not doing sitewide sample') /* eslint-disable-line no-console */
  }
  return filesDidChange
}

function sample(array, limit = 1) {
  const indices = [];
  while(indices.length < limit) {
    const r = Math.floor(Math.random() * (array.length - 1)) + 1;
    if (indices.indexOf(r) === -1) indices.push(r);
  }
  const sampleSet = []
  indices.forEach((ind) => { sampleSet.push(array[ind]) });
  if (sampleSet.length === 1) { return sampleSet[0] }
  return sampleSet
}

function sampleFiles () {
  const collections = {
    authors: '_site/author/*/index.html',
    blog: '_site/blog/page/[0-9]*/index.html',
    posts: '_site/20[0-9][0-9]/**/index.html',
    services: '_site/project/*/index.html',
    tags: '_site/tags/*/index.html',
    root: '_site/*/index.html'
  }

  const siteFiles = []
  Object.entries(collections).forEach(([name, pattern]) => {
    if (name === 'root') {
      siteFiles.push(glob.sync(pattern))
    } else {
      siteFiles.push(sample(glob.sync(pattern), 3))
    }
  });
  return siteFiles.flat()
}

// Looks through all the files coming from eleventy:after. If any of
// the documents should be scanned, list the files to be scanned in
// the pa11y targets file.
//
// We list the output paths because that's where the generated HTML
// lives, the page that will be seen by the public.
//
function pa11yPerPage({ dir, results }) {
  const differ = process.env.CI ? new CommitDiffer : new Differ
  const changedFiles = differ.changedFiles();
  const filesToWrite = [];

  results.forEach((result) => {
    const doc = new Document(result, dir, changedFiles);
    if (doc.shouldScan()) { filesToWrite.push(result.outputPath) }
  });

  return filesToWrite
}

async function pa11yScan ({ dir, results }) {
  if (!process.env.PA11Y_SCAN) { return false }

  const pa11yList = process.env.PA11Y_TARGET_FILE || 'PA11Y_TARGETS';

  const perPageFiles = pa11yPerPage({ dir, results });
  let sitewideFiles = [];

  if (didSitewideFilesChange()) {
    sitewideFiles = sampleFiles()
  }
  const filesList = perPageFiles.concat(sitewideFiles)
  const uniqueFiles = new Set(filesList)
  const filesToWrite = Array.from(uniqueFiles)

  fs.writeFile(pa11yList, filesToWrite.join('\n'), 'utf8', (err) => {
    if (err) throw err;
    console.log('[per page] Wrote', perPageFiles.length, 'files to', pa11yList); /* eslint-disable-line no-console */
    console.log('[sitewide] Wrote', sitewideFiles.length, 'files to', pa11yList); /* eslint-disable-line no-console */
  });

  return true;
}

module.exports = {
  pa11yScan,
}
