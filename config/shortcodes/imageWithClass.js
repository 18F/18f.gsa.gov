const assetUrl = require('../../lib/asset_url')

module.exports = async (src, cls='', alt='') => `<img src="${await assetUrl(src)}" class="${cls}" alt="${alt}" loading="lazy" decoding="async">`
