const privateLinks = require ('../config/markdown/privateLinksList');

// @param token [Token] The Markdown-It token for the link
// @param privateDomains [Array<String>] A list of private / protected domain names
const isPrivateLink = (token, privateDomains=privateLinks) => { /* eslint-disable-line no-unused-vars */
  const href = token.attrGet('href')
  privateDomains.some(privateDomain => href.includes(privateDomain))
}

/* Determine if a given link is external (to the Federal government)
 * @returns Boolean
 * There are three main cases, in order of frequency:
 *   - Internal path or anchor within 18f.gsa.gov -> do nothing
 *   - External URL -> If it ends in .gov, assume it's Federal, otherwise mark external
 *   - Mailto -> If it ends in .gov, assume it's Federal, otherwise mark external
 */
const isInternalLink = (href) => {
  if (href.startsWith('/') || href.startsWith('#')) {
    return true
  } if (href.startsWith('mailto:')) {
    return href.endsWith('.gov')
  }
  return (new URL(href)).hostname.endsWith('.gov')
}

/* Determine if a given link is external (to the Federal government)
 * @returns Boolean
 */
const isExternalLink = (href) => !isInternalLink(href)

/* Mark a link as external, by adding appropriate CSS classes and attributes
 *   internal: within the Federal government, or
 *   external: outside the Federal government
 * @returns Boolean
 */
const externalize = (token) => {
  if (isInternalLink(token.attrGet('href'))) { return token }
  const cssClass = token.attrGet('class') || ''
  if (!cssClass.includes('usa-link--external')) {
    token.attrJoin('class', 'usa-link usa-link--external');
  }

  // Set rel=noreferrer if it hasn't been set yet
  const rel = token.attrGet('rel') || ''
  if (!rel.includes('noreferrer')) {
    token.attrJoin('rel', 'noreferrer');
  }
  return token
}

module.exports = {
  externalize,
  isExternalLink,
  isPrivateLink,
}
