const fs = require('fs')
const yaml = require('js-yaml')
// const glob = require('glob')

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
    return this.changedFiles.includes(`${this.dir.layouts}/${this.layout}`)
  }

  // Gets the name of the layout for this file, using the first of:
  //   - The layout specified in the file
  //   - The layout specified in an *.11tydata.js file
  //
  layoutName() {
    return this.layoutNameInFrontmatter() || this.layoutNameIn11tyData()
  }

  layoutNameInFrontmatter() {
    const file = fs.readFileSync(this.result.inputPath, 'utf8');
    const data = yaml.load(file.split('---\n')[1])
    return data.layout
  }

  layoutNameIn11tyData() {
    if (this.result.inputPath.includes('/posts/')) {
      return 'post.html'
    }
    return undefined
    // @todo This hardcoding above should not stay there. We should do the following.
    //         When I run this in a console, it's perfect; when I run it as part of
    //         the test, we get a "module not found" error.
    // const folderPath = this.result.inputPath.split('/').slice(0,-1).join('/')
    // const globber = folderPath + '/*.11tydata.js'
    // const modulePath = glob.sync(globber)[0].replace(/\.js$/, '')
    // const { layout } = require(modulePath)
    // return layout
  }
}

module.exports = {
  Document,
}
