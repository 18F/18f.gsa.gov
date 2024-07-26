module.exports = async (collection, author) => collection.filter((post) => post.data.authors.includes(author))
