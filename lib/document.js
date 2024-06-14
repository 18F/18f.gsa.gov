const {execSync} = require('child_process');

// Takes an 11ty "result" (a post or page), the dir (folder/config),
// and a list of changed files from the appropriate differ class.
//
// A Document knows whether or not it's in the list of changed files,
// and Document#shouldScan returns true if it should be included in
// the next pa11y check.
class Document {
  constructor(result, dir, changedFiles) {
    this.result = result;
    this.dir = dir;
    this.layout = this.layoutName();
    this.changedFiles = changedFiles;
  }

  shouldScan() {
    return this.didSourceChange() || this.didLayoutChange()
  }

  // Returns whether the input (source) file was modified
  // The slice(2) is to remove the "./" at the beginning of the path
  didSourceChange() {
    return this.changedFiles.includes(this.result.inputPath.slice(2))
  }

  // Returns whether this file's layout changed
  didLayoutChange() {
    return this.changedFiles.includes(`${this.dir.layouts}${this.layout}`)
  }

  // Gets the name of the layout for this file. If there's no layout,
  // assume it uses the "default" layout.
  // @todo Change this from system `grep` to parsing the YAML frontmatter
  // @todo Assuming the "default" may not be a safe assumption
  //
  layoutName() {
    let maybeMatch;
    const layoutMatcher = `grep -i "^\s*layout: " "${this.result.inputPath}"` /* eslint-disable-line no-useless-escape */
    try { maybeMatch = execSync(layoutMatcher) } catch { return 'default' }
    return String(maybeMatch).trim().split(/layout: /)[1]
  }
}

module.exports = {
  Document,
}
