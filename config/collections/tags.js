// code smell: This is not the slugify library used by 11ty
// However, that library requires ESM and this project is CommonJS.
// The best thing to do would be to import the slugify filter, but I'm not quite
// sure how to do that from this separate file — perhaps dependency injection
// in .eleventy.js?
const slugify = require('../../lib/slugify');

// Create a collection of all tags across all posts
// Each tag has a `name` property, as well as a `posts` array with all the posts with that tag
module.exports = async (collection) => {
  const tagMap = new Map();

  collection.getAll().sort((a, b) => b.date - a.date).forEach((post) => {
    (post.data.tags || []).forEach((tag) => {
      if (!tagMap.has(tag)) {
        tagMap.set(tag, [])
      };
      tagMap.get(tag).push(post)
    });
  });

  // Alpha-sorts tags by key, so that we don't have to do any sorting to get the tag index
  // displaying tags in alphabetical order
  const sortedMap = new Map([...tagMap].sort((a, b) => String(a[0]).localeCompare(b[0])))

  // Creates the data object with the right keys
  const tags = []
  sortedMap.forEach((posts, name) => {
    const slug = slugify(name, { lower: true, strict: true });
    tags.push({
      data: {
        name,
        posts,
        posts_count: posts.length
      },
      date: null,
      fileSlug: slug,
      inputPath: null,
      url: `/tags/${ slug }/`,
    })
  })
  return tags;
  // I commented this out — it's not clear what it's doing and it doesn't seem important.
  // return filterTagList([...tagSet]);
};
