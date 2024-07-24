const path = require('path')
const Image = require('@11ty/eleventy-img')

module.exports = async (imageSrc) => {
  let pathPrefix = ''

  if (process.env.BASEURL) {
    pathPrefix = process.env.BASEURL
  }

  const ext = path.extname(imageSrc)
  const fileType = ext.replace('.', '')
  const formats = [fileType]
  const options = {
    formats,
    outputDir: './_site/img/',
    filenameFormat (id, src, width, format, opts) { /* eslint-disable-line no-unused-vars */
      return `${path.basename(src, path.extname(src))}-${id}.${format}`;
    }
  }

  const metadata = await Image(imageSrc, options)

  const data = metadata[fileType] ? metadata[fileType][0] : metadata.jpeg[0]
  return `${pathPrefix}${data.url}`
}
