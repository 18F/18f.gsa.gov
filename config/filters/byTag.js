module.exports = async (collection, tag) => collection.filter((post) => post.data.tags.includes(tag));
