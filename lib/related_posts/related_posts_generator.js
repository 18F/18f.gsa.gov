const { Differ } = require('../differ')
const { CommitDiffer } = require('../commit_differ')

const Cache = require('./cache')
const ScoresKey = require('./scores_key')
const PostsCollection = require('./posts_collection')
const SimilarityScores = require('./similarity_scores')

class RelatedPostsGenerator {
  #scores

  #cache

  #relatedPostsCache

  #postsCollection

  #backupPosts

  #limit

  constructor({ cache=true, backupPosts=4, limit=3 }={}) {
    this.#cache = cache
    this.#scores = (new SimilarityScores())
    this.#scores.build()
    this.#relatedPostsCache = new Cache
    this.#postsCollection = new PostsCollection
    this.#backupPosts = this.#postsCollection.posts().slice(-1 * backupPosts).reverse()
    this.#limit = limit
  }

  // If there's already a related posts cache, just use it.
  // If there's not, or we're skipping caching, do the work of building the cache.
  generate () {
    // Exit early and return the existing cache if:
    // We care about the cache, no posts have changed, and there's a cache already
    if (this.exitEarly()) { return this.#relatedPostsCache.current() }

    const postsWithRelated = this.#postsCollection.posts().map((post) => this.#addRelated(post))

    if (this.#cache) {
      this.#relatedPostsCache.saveAndClean(postsWithRelated)
    }
    return postsWithRelated
  }

  exitEarly () {
    return this.#cache && !this.#didPostFilesChange() && this.#relatedPostsCache.exists()
  }

  // @todo This doesn't apply tiebreakers for tied scores - ideally it would ensure
  //   most recent first, but it's ok that it's not deterministic
  #addRelated(post) {
    const similarPosts = this.#scores.entriesMatching(post.inputPath)
    const relatedPosts = []

    relatedPosts.push(...similarPosts
      .map(([key, ]) => ScoresKey.decodeOtherPost(key, post.inputPath))
      .map(path => this.#postsCollection.findByPath(path))
    )
    if (relatedPosts.length < this.#limit) {
      relatedPosts.push(...this.#backupPosts.filter((backup) => backup.inputPath !== post.inputPath).slice(0, this.#limit - similarPosts.length))
    }

    return {
      inputPath: post.inputPath,
      related: relatedPosts.map(this.#postToRelatedPost)
    }
  }

  #didPostFilesChange () { /* eslint-disable-line class-methods-use-this */
    const differ = process.env.CI ? new CommitDiffer : new Differ
    const changedFiles = differ.changedFiles();
    const changedPosts = changedFiles.filter((f) => f.startsWith('content/posts') && f.endsWith('.md'))
    return changedPosts.length > 0
  }

  // This could belong to Post
  #postToRelatedPost(post) { /* eslint-disable-line class-methods-use-this */
    return {
      inputPath: post.inputPath,
      title: post.data.title,
      excerpt: post.data.excerpt
    }
  }

}

module.exports = RelatedPostsGenerator
