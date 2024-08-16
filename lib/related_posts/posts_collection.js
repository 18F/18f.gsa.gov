const glob = require('glob')
const Post = require('./post')

// Collection of all the posts, represented by Post objects
// @example
//   collection = new PostsCollection
//   collection.findByPath('path/to/post') #=> Post
//   collection.posts() #=> [Post 1, Post 2, Post 3, ...]
class PostsCollection {
  #posts

  // @param postFoldres [Array<string>] folders to read to get posts data
  constructor(postFolders=['content/posts/']) {
    this.#posts = this.#buildPosts(postFolders)
  }

  // @return [Array<Post>] list of posts
  // @todo This doesn't make sense as an interface everywhere. I wonder
  //   if it would be better to return an iterator like forEach
  posts() {
    return this.#posts
  }

  // Get the first Post that exactly matches the given path
  // @return [Post]
  findByPath(path) {
    return this.posts().find((post) => post.inputPath === path)
  }

  // Sets up all the posts to be part of the collection
  // @return [Array<Post>] all posts in the given folders
  #buildPosts(postFolders) { /* eslint-disable-line class-methods-use-this */
    const postFiles = []
    postFolders.forEach((folder) => {
      postFiles.push(...glob.sync(`${ folder }/**/*.md`))
    })
    return [...new Set(postFiles)]
      .map((path) => new Post(path))
      .reverse()
  }
}

module.exports = PostsCollection
