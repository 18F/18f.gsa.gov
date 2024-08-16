/*
* Handles encoding and decoding of cache keys for
* the similarity scores.
*/
const ScoresKey = {
  separator: '||',

  // Returns a cache key that's the combination of two strings, in our
  // implementation, the paths to two posts.
  // @param post [string] path to one post
  // @param otherPost [string] path to the other post
  // @return [string] an encoded cache key
  // @example
  //   ScoresKey.encode(a.path, b.path)
  //   #=> "a/||b/"
  encode (postPath, otherPostPath) {
    return [postPath, otherPostPath].sort().join(this.separator)
  },

  // @param encodedKey [string] the cache key for the two posts
  // @example
  //   ScoresKey.decode("a||b")
  //   #=> ["a", "b"]
  decode (encodedKey) {
    return encodedKey.split(this.separator)
  },

  // @example
  //   ScoresKey.decodeThisPost("a||b", "a")
  //   #=> "a"
  decodeThisPost (encodedKey, postPath) {
    return this.decode(encodedKey).find((path) => path === postPath)
  },

  // @example
  //   ScoresKey.decodeOtherPost("a||b", "a")
  //   #=> "b"
  decodeOtherPost (encodedKey, postPath) {
    return this.decode(encodedKey).find((path) => path !== postPath)
  }
}

module.exports = ScoresKey
