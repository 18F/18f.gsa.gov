const fs = require('fs');
const yaml = require('js-yaml')

// Represents post data, as defined by YAML frontmatter
class Post {
  constructor(path) {
    const file = fs.readFileSync(path, 'utf8');
    this.inputPath = `./${path}` // The ./ is important for matching in the template
    this.data = yaml.load(file.split('---\n')[1])
  }

  // Compares two posts' frontmatter for similar authors and similar
  // tags and returns a similarity score
  //
  // Current algorithm:
  //   - Each author in common is +1
  //   - Each tag in common is +1
  //   - If there are both authors and tags in common, multiply the
  //       score by x2
  //
  // @param otherPost [Post] the post to compare
  // @return [number]
  similarityTo(otherPost) {
    const commonAuthors = this.#intersection(this.data.authors, otherPost.data.authors).size
    const commonTags = this.#intersection(this.data.tags, otherPost.data.tags).size
    const multiplier = (commonAuthors > 0 && commonTags > 0) ? 2 : 1
    return (commonTags + commonAuthors) * multiplier
  }

  // code smell: This really doesn't belong here, it should be in Array or Set
  #intersection(listA, listB) { /* eslint-disable-line class-methods-use-this */
    const setA = new Set(listA)
    const setB = new Set(listB)
    const result = new Set();
    setA.forEach((value) => {
      if (setB.has(value)) {
        result.add(value)
      }
    });
    return result
  }
}

module.exports = Post
