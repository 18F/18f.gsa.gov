const MarkdownIt = require('markdown-it');

module.exports = async (content) => {
  const md = new MarkdownIt({ html: true });
  return md.render(content);
};
