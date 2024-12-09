const markdownIt = require('markdown-it');
const markdownItAttrs = require('markdown-it-attrs');
const markdownItAnchor = require('markdown-it-anchor');
const markdownItFootnote = require('markdown-it-footnote');

const { headingLinks } = require('./headingLinks');
const privateLinks = require ('./privateLinksList');
const slugify = require('../../lib/slugify')

const { externalize, isPrivateLink } = require('../../lib/links')

// Customize Markdown library and settings
const markdownLibrary = markdownIt({
  html: true,
  breaks: false,
  linkify: false,
}).use(markdownItAnchor, {
  permalink: headingLinks,
  slugify,
}).use(markdownItAttrs).use(markdownItFootnote);

// Override Footnote opener
markdownLibrary.renderer.rules.footnote_block_open = () => (
  '<section class="footnotes" role="doc-endnotes">\n' +
  '<ol class="footnotes-list">\n'
);

// // Override backlink to add ARIA role
// // Copied from https://github.com/markdown-it/markdown-it-footnote/blob/master/index.mjs#L57-L64
markdownLibrary.renderer.rules.footnote_anchor = (tokens, idx, options, env, self) => {
  let id = self.rules.footnote_anchor_name(tokens, idx, options, env, self)

  if (tokens[idx].meta.subId > 0) id += `:${tokens[idx].meta.subId}`

  /* ↩ with escape code to prevent display as Apple Emoji on iOS */
  return ` <a href="#fnref${id}" class="footnote-backref" role="doc-backlink">\u21a9\uFE0E</a>`
}


// Add icons for links with locked resources and external links
// https://github.com/markdown-it/markdown-it/blob/master/docs/architecture.md
// Token methods:  https://github.com/markdown-it/markdown-it/blob/master/lib/token.js#L125
const openDefaultRender = markdownLibrary.renderer.rules.link_open ||
  function(tokens, idx, options, env, self) { /* eslint-disable-line func-names */
    return self.renderToken(tokens, idx, options);
  };

const lockIcon = '<span class="usa-sr-only">18F only,</span>' +
                   '<svg class="usa-icon margin-top-2px margin-right-2px top-2px" aria-hidden="true" role="img">' +
                      '<use xlink:href="#svg-lock_outline"></use>' +
                   '</svg>'

markdownLibrary.renderer.rules.link_open = (tokens, idx, options, env, self) => {
  const token = tokens[idx];
  externalize(token) // Smell: this is mutating `token`` within the array `tokens`

  return [
    openDefaultRender(tokens, idx, options, env, self),
    isPrivateLink(token) ? lockIcon : ''
  ].join('')
};

const defaultHtmlBlockRender = markdownLibrary.renderer.rules.html_block ||
  function(tokens, idx, options, env, self) { /* eslint-disable-line func-names */
    return self.renderToken(tokens, idx, options);
  };

markdownLibrary.renderer.rules.html_block = (tokens, idx, options, env, self) => {
  const token = tokens[idx];
  let {content} = token;
  // Capture the class portion of the element if it exists so it can be interacted with later
  // https://regexr.com/7udrd
  const hrefRE = /<a href="[^"]*" class="([^"]*)">|href="([^"]*)"/g;
  const htmlIncludesLinks = content.includes('http') && hrefRE.test(token.content);

  if (htmlIncludesLinks) {
    const matches = content.match(hrefRE);

    matches.forEach(anchorElement => {
      if (!anchorElement.includes('.gov')) {
        if (!anchorElement.includes('class=')) {
          if (!anchorElement.includes('usa-link--external')) {
            // Since no class is present, we can safely just append our classes after the href property
            const newUrl = `${anchorElement  } class="usa-link usa-link--external"`;
            content = content.replace(anchorElement, newUrl);
            tokens[idx].content = content;
          }
        } else {
          // Handle URLs with classes already present
          const classRE = /class="([^"]*)"/;
          const [classString, oldClassList] = anchorElement.match(classRE);
          const newClassList = `${oldClassList  } usa-link usa-link--external`;

          // If someone uses the class property but doesn't actually put any classes in it, the class list will be empty
          if (classString === 'class=""') {
            content = content.replace(classString, 'class="usa-link usa-link--external"');
          } else {
            content = content.replace(oldClassList, newClassList);
          }
          tokens[idx].content = content;
        }
      }
    });
  }

  return defaultHtmlBlockRender(tokens, idx, options, env, self);
}

// Also need to add icon links to any html style links
const inlineHTMLDefaultRender = markdownLibrary.renderer.rules.html_inline ||
  function(tokens, idx, options, env, self) { /* eslint-disable-line func-names */
    return self.renderToken(tokens, idx, options);
  };

const linkOpenRE = /^<a[>\s]/i;
markdownLibrary.renderer.rules.html_inline = (tokens, idx, options, env, self) => {
  const token=tokens[idx];
  if (linkOpenRE.test(token.content) && token.content.includes('http')) {
    let {content} = token;

    // Add private link icon
    const hrefRE = /href="([^"]*)/;
    // get the matching capture group
    const contentUrl =  content.match(hrefRE)[1];
    if (privateLinks.some((privateLink) => contentUrl.indexOf(privateLink) >= 0)) {
      const prefixIcon = '<span class="usa-sr-only"> 18F only, </span>' +
                         '<svg class="usa-icon margin-top-2px margin-right-2px top-2px" ' +
                         'aria-hidden="true" role="img">' +
                         '<use xlink:href="#svg-lock_outline"></use>' +
                         '</svg>'
      content = content.replaceAll('>', `> ${prefixIcon}`);
      tokens[idx].content = content;
    }

    // Add external links, as definied above
    if (!content.includes('.gov')) {
      if (content.includes('class=')) {
        if (!content.includes('usa-link--external')) {
          content = content.replace('class="', 'class="usa-link usa-link--external ');
          tokens[idx].content = content;
        }
      }
      else {
        content = content.replaceAll('>', ' class="usa-link usa-link--external">');
        tokens[idx].content = content;
      }
      if (content.includes('rel=')) {
        if (!content.include('noreferrer')) {
          content = content.replace('rel=', 'rel="noreferrer ">');
          tokens[idx].content = content;
        }
      }
      else {
        content = content.replaceAll('>', ' rel="noreferrer">');
        tokens[idx].content = content;
      }
    }
  }
  return inlineHTMLDefaultRender(tokens, idx, options, env, self);
}

module.exports = markdownLibrary
