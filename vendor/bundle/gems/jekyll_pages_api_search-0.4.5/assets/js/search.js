/* eslint-env browser, node */

'use strict';

var SearchEngine = require('./search-engine');
var SearchUi = require('./search-ui');

function writeResultsToList(query, results, doc, resultsList) {
  results.forEach(function(result, index) {
    var item = doc.createElement('li'),
        link = doc.createElement('a'),
        text = doc.createTextNode(result.title);

    link.appendChild(text);
    link.title = result.title;
    link.href = result.url;
    item.appendChild(link);
    resultsList.appendChild(item);

    link.tabindex = index;
    if (index === 0) {
      link.focus();
    }
  });
}

module.exports = function() {
  var searchUi = new SearchUi(window.document,
        window.JEKYLL_PAGES_API_SEARCH_UI_OPTIONS),
      searchEngine = new SearchEngine(
        window.JEKYLL_PAGES_API_SEARCH_ENGINE_OPTIONS);

  searchUi.enableGlobalShortcut();

  if (!searchUi.resultsElement) {
    return;
  }


  return searchEngine.executeSearch(window.JEKYLL_PAGES_API_SEARCH_BASEURL, window.location.href)
    .then(function(searchResults) {
      searchUi.renderResults(searchResults.query, 
        searchResults.results || [],
        window.renderJekyllPagesApiSearchResults || writeResultsToList);
    })
    .catch(function(error) {
      console.error(error);
    });
}();
