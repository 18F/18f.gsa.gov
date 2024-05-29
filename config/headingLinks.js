/* eslint no-restricted-syntax: 0 */
/** eslint doesn't like iterators/generators */
// From https://github.com/18F/handbook/blob/ddf9f29bce09d6c7ac1d0f2f33a99b75bc5c8223/config/headingLinks.js

// https://www.npmjs.com/package/markdown-it-anchor#custom-permalink
//
// * slug  | the slugified id of the heading
// * _     | options passed into markdown-it-anchor; we don't use them
// * state | a complete tree of the Markdown document as parsed by markdown-it
// * index | the index of the token in the state of the current heading
const headingLinks = (slug, _, state, index) => {

  // We also need to find the index of the element that closes the header. We'll
  // put our link stuff right before that.
  let closeIndex = index + 1;
  while (state.tokens[closeIndex].type !== 'heading_close') {
    closeIndex += 1;
  }

  // Insert an HTML block into the markdown tree. This way markdown-it won't
  // try to parse it, it'll just dump it directly into the output.
  const headingLink = {
    type: 'html_block',
    content: `
  
    <a href="#${slug}"
      class="heading-permalink"
      aria-label="Permalink for this section">
      <svg class="usa-icon" aria-hidden="true" focusable="false" role="img">
        <use xlink:href="#svg-link"></use>
      </svg>
    </a>
`,
  };

  // Splice the new stuff directly into the tree.
  state.tokens.splice(closeIndex, 0, headingLink);
};

module.exports = { headingLinks };
