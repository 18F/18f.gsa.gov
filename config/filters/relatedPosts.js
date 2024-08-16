const RelatedPostsCache = require('../../lib/related_posts/cache');

const cache = (new RelatedPostsCache).current()

module.exports = async (post) => cache.find(p => p.inputPath === post.inputPath).related
