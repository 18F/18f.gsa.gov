const fs = require('fs');
const yaml = require('js-yaml');

module.exports = async (relativeUrl) => {
  const { host } = yaml.load(fs.readFileSync('./data/site.yaml', 'utf8'))
  return new URL(relativeUrl, host).href
}
