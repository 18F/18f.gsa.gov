const PostsCollection = require('./posts_collection')
const ScoresKey = require('./scores_key')

/*

We compare all posts to all other posts to determine how similar
they are, and use the top few posts as the "related posts" on a blog
post page.

SimilarityScores is sort of a table of similarity scores, keeping track
of how similar each post is to all other posts. We don't compare a post
to itself, because we never want a post to be its own related post.

  |        | Post 1 | Post 2 | Post 3 |
  |:------:|:------:|:------:|:------:|
  | Post 1 |        |   12   |    8   |
  | Post 2 |    4   |        |    4   |
  | Post 3 |    2   |    4   |        |
*/
class SimilarityScores {
  // Code smell: This class has too many direct accesses to the data.
  // Ideally, data would be wrapped in a method.
  #scores

  #keepZeros

  #entries

  constructor ({scores={}, keepZeros=false}={}) {
    this.#scores = scores
    this.#keepZeros = keepZeros
  }

  // Table entries, memoized so they're not repeatedly generated.
  entries() {
    if (this.#entries) { return this.#entries }
    this.#entries = this.#processEntries()
    return this.#entries
  }

  // Used to get all the entries matching a given post path, to get
  // that post's related posts.
  entriesMatching(matcher, limit=3) {
    return this.entries().filter(([key, ]) => key
      .includes(matcher))
      .sort((a, b) => b[1] - a[1])
      .slice(0, limit)
  }


  // Pre-processes the table entries.
  // @note for the future, if other pre-processing needs to happen, add it here.
  #processEntries() {
    if (this.#keepZeros) {
      this.#entries = Object.entries(this.#scores)
    } else {
      // Remove zeroes from the cache
      this.#entries = Object.entries(this.#scores).filter(([ , score]) => score > 0)
    }
    return this.#entries
  }

  /*
    Recursive function that compares posts to all other posts, building
    a table of similarity scores.

    Given an array of posts, run pairwise comparison of that post and the
    each of the rest of the posts, putting the results in an object
    literal and then recursively pass the remaining posts plus the cache
    to this function until there are no posts left.

    @param [Array<Post>] collection of posts for the similarity scores
  */
  build(posts=(new PostsCollection).posts(), cache=this.#scores) {
    if (posts.length === 0) {
      this.#scores = cache
      return this.#scores;
    }
    const [post, ...otherPosts] = posts;
    const updatedCache = otherPosts.reduce((accumulator, otherPost) => this.#add(post, otherPost, accumulator), cache)
    return this.build(otherPosts, updatedCache)
  }

  /*
    Given a pair of posts and a cache, add the posts' similiarity score
    to the cache.
    - Creates a key from the paths of those posts, always sorted
    so that comparing A and B is the same as comparing B and A.
    - Checks for that key in the cache
    - If the key is not there / the pair has not been scored,
      calculate the similarity score and update the cache.
  */
  #add(post, otherPost, cache) { /* eslint-disable-line class-methods-use-this */
    const key = ScoresKey.encode(post.inputPath, otherPost.inputPath)
    if (!cache[key]) { cache[key] = post.similarityTo(otherPost) }
    return cache
  }

}

module.exports = SimilarityScores
