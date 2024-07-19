const RelatedPostsGenerator = require('./related_posts_generator')

function generateRelatedPosts({ cache=true }={}) {
  (new RelatedPostsGenerator({ cache })).generate()
}

module.exports = generateRelatedPosts
