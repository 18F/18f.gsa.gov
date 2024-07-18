const fs = require('fs');
const glob = require('glob')
const yaml = require('js-yaml')
const { DateTime } = require('luxon')
const { Differ } = require('./differ')
const { CommitDiffer } = require('./commit_differ')

// Builds the file path for a related posts cache, using the current time.
//   Optionally pass in timestamp for a deterministic result.
// @param ts [number, string, undefined] Timestamp to assign to the filename
// @return [string] Filepath to a related posts cache
// @example With no given timestamp, uses current time
//   filepath() => `.cache/related-posts-1720796065028`
// @example With a given timestamp
//   filepath(1737392400000) => `.cache/related-posts-1737392400000`
const filepath = (ts=undefined) =>  `.cache/related-posts-${ ts || DateTime.now().ts }.json`

// Creates a related posts cache file for the current time (or given timestamp)
//   and writes the given object to the file as JSON data
// @param ts [number, string, undefined] Timestamp to assign to the filename
// @param data [object] data to write to the file
// @return [undefined]
const createFile = (data={}, ts=undefined) => fs.writeFileSync(filepath(ts), JSON.stringify(data))

// @return [Array<string>] List of filepaths to related posts caches
const cacheFiles = () => fs.readdirSync('.cache').filter(file => file.startsWith('related-posts-')).sort().reverse()

// @return [object] JSON data from the most recent cache
const currentCache = () => JSON.parse(fs.readFileSync(`.cache/${cacheFiles()[0]}`))

// Deletes all caches except the cache with the most future date
// @return [undefined]
const deleteOldCaches = () => cacheFiles().slice(1,).forEach(file => fs.unlinkSync(`.cache/${file}`))

// Deletes all caches
// @return [undefined]
const deleteAllCaches = () => cacheFiles().forEach(file => fs.unlinkSync(`.cache/${file}`))

function markdownPostsSet() {
  const postFolders = ['content/posts/']
  const markdownPosts = [];
  postFolders.forEach((folder) => {
    markdownPosts.push(glob.sync(`${folder}/**/*.md`))
  });
  return new Set(markdownPosts.flat())
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

// Compares two files' frontmatter for similar authors and similar tags and returns
//   a similarity score
// Current algorithm:
//   - Each author in common is +1
//   - Each tag in common is +1
//   - If there are both authors and tags in common, multiply the base score x2
// @param file [object] JSON data representing front matter of the current file
// @param other [object] JSON data representing front matter of the file being compared
// @return [number]
const similarity = (file, other) => {
  const commonAuthors = intersection(new Set(file.authors), new Set(other.authors)).size
  const commonTags = intersection(new Set(file.tags), new Set(other.tags)).size
  const multiplier = (commonAuthors > 0 && commonTags > 0) ? 2 : 1
  return (commonTags + commonAuthors) * multiplier
}

function updateCacheWithSimilarityForPair(post, otherPost, cache) {
/*
 * Given a pair of posts and a cache, create a key from the paths of those posts (always sorted so that comparing A and B is the same as comparing B and A), check for that key in the cache, and if it's not there, run similarity() on the posts and update the cache with that score.
 */
  const cacheKey = [post, otherPost].map((p) => p.path).sort().join('||')
  cache[cacheKey] = cache[cacheKey] || similarity(post, otherPost)
  return cache
}

function buildSimilarityCache(posts=[], cache={}) {
  /*
   * Given an array of posts, run pairwise comparison of that post and the each of the rest of the posts, putting the results in an object literal and then recursively pass the remaining posts plus the cache to this function until there are no posts left.
   */
  if (posts.length === 0) {
    return cache;
  } 
  const [post, ...otherPosts] = posts;
  const updatedCache = otherPosts.reduce((accumulator, otherPost) => updateCacheWithSimilarityForPair(post, otherPost, accumulator), cache)
  return buildSimilarityCache(otherPosts, updatedCache)
  
}

function pathToYaml(path) {
  const contents = fs.readFileSync(path, 'utf8');
  const chunks = contents.split('---\n')
  const metadata = yaml.load(chunks[1]);
  metadata.path = path;
  return metadata
}

async function relatedPosts ({ dir, eleventyEventResults }) {
  const differ = process.env.CI ? new CommitDiffer : new Differ
  const changedFiles = differ.changedFiles();
  const changedPosts = changedFiles.filter((f) => f.startsWith('content/posts') && f.endsWith('.md'))

  if (changedPosts.length === 0) {
      return currentCache();
  }

  function tagsAuthorsFromMetadata(metadata) {
    const { authors, tags, path, date, title, excerpt } = metadata;

    return  { authors, tags, path, date, title, excerpt};
  }

  const postsCollection = Array.from(markdownPostsSet());
  const postsYaml = postsCollection.map(pathToYaml);
  const postsData = postsYaml.map(tagsAuthorsFromMetadata);
  const mostRecentFour = postsData.slice(-4).reverse();

  const similarityCache = buildSimilarityCache(postsData, {});
  const nozeroCacheEntries = Object.entries(similarityCache).filter(([key, score]) => score > 0)

  function addRelated(post, cache, posts) {
    // Note that this doesn't apply good tiebreakers for tied scores
    const mentioned = cache.filter(([key, score]) => key.includes(post.path)).sort((itemA, itemB) => itemB[1] - itemA[1]).slice(0,3)
    const findPostByPath = (path) => posts.find((p) => p.path === path)
    function getOtherPost (cacheKey, postPathToNotFind) {
      const otherPath =findPostByPath(
        cacheKey.split('||').find((path) => path !== postPathToNotFind)
      )
    if (otherPath.path === post.path) {
      console.log(postPathToNotFind);
      console.log(cacheKey);
        console.log(otherPath.path);
    }
      return otherPath

    }
    const otherPosts = mentioned.map((entry) => getOtherPost(entry[0], post.path)).map((entry) => ({ path: entry.path, title: entry.title, excerpt: entry.excerpt }) )
    if (otherPosts.length < 3) {
        otherPosts.push(...mostRecentFour.filter((p) => p.path !== post.path).slice(0, 3-otherPosts.length))
    }
    post.related = otherPosts
    return post
  }

  const withRelated = postsData.map((p) => addRelated(p, nozeroCacheEntries, postsData))

  createFile(withRelated)
  deleteOldCaches()
  return withRelated

/*

tmake:

process.exit()
node
const { relatedPosts } = require('./lib/related_posts')
relatedPosts({})

 */
}

module.exports = {
  relatedPosts,
}
