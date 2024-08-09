const markdownIt = require('markdown-it');
const markdownItAttrs = require('markdown-it-attrs');
const markdownItAnchor = require('markdown-it-anchor');
const markdownItFootnote = require('markdown-it-footnote');

const { headingLinks } = require('./headingLinks');
const privateLinks = require ('./privateLinksList');
const slugify = require('../../lib/slugify')

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
'<section class="footnotes">\n' +
'<ol class="footnotes-list">\n'
);

// Add icons for links with locked resources and external links
// https://github.com/markdown-it/markdown-it/blob/master/docs/architecture.md
// Token methods:  https://github.com/markdown-it/markdown-it/blob/master/lib/token.js#L125
const openDefaultRender = markdownLibrary.renderer.rules.link_open ||
  function(tokens, idx, options, env, self) { /* eslint-disable-line func-names */
    return self.renderToken(tokens, idx, options);
  };

markdownLibrary.renderer.rules.link_open = (tokens, idx, options, env, self) => {
  const token = tokens[idx];
  let prefixIcon = '';
  if (privateLinks.some((link) => token.attrGet('href').indexOf(link) >= 0)) {
    prefixIcon = '<span class="usa-sr-only"> 18F only, </span>' +
                 '<svg class="usa-icon margin-top-2px margin-right-2px top-2px" ' +
                 'aria-hidden="true" role="img">' +
                 '<use xlink:href="#svg-lock_outline"></use>' +
                 '</svg>'
  }

  // Check for external URLs. External means any site that is not a federal .gov url
  // This check can't detect state/local .gov domains. Those will need to be
  // manually adjusted
  const baseURL = new URL('https://18f.gsa.gov/');
  const hrefValue = token.attrGet('href');

  if (!(new URL(hrefValue, baseURL).hostname.endsWith('.gov'))) {
    // Add the external link class if it hasn't been added yet
    if (!(token.attrGet('class')) || !(token.attrGet('class').includes('usa-link--external'))) {
      token.attrJoin('class', 'usa-link usa-link--external');
    }

    // Set rel=noreferrer if it hasn't been set yet
    if (!(token.attrGet('rel')) || !(token.attrGet('rel').includes('noreferrer'))) {
      token.attrJoin('rel', 'noreferrer');
    }
  }
  return `${openDefaultRender(tokens, idx, options, env, self)  }${prefixIcon}`;
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
      content = content.replace('>', `> ${prefixIcon}`);
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
        content = content.replace('>', ' class="usa-link usa-link--external">');
        tokens[idx].content = content;
      }
      if (content.includes('rel=')) {
        if (!content.include('noreferrer')) {
          content = content.replace('rel=', 'rel="noreferrer ">');
          tokens[idx].content = content;
        }
      }
      else {
        content = content.replace('>', ' rel="noreferrer">');
        tokens[idx].content = content;
      }
    }
  }
  return inlineHTMLDefaultRender(tokens, idx, options, env, self);
}

module.exports = markdownLibrary
