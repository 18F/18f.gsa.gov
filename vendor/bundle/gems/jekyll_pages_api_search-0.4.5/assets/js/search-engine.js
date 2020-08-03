/* eslint-env browser, node */

'use strict';

var lunr = require('lunr');
var querystring = require('querystring');
var url = require('url');

module.exports = SearchEngine;

function SearchEngine(options) {
  var opts = options || {};

  this.indexPath = opts.indexPath || SearchEngine.DEFAULT_SEARCH_INDEX_PATH;
  this.queryParam = opts.queryParam || SearchEngine.DEFAULT_QUERY_PARAM;
}

SearchEngine.DEFAULT_SEARCH_INDEX_PATH = '/search-index.json';
SearchEngine.DEFAULT_QUERY_PARAM = 'q';

SearchEngine.prototype.fetchIndex = function(baseUrl) {
  var engine = this;

  return new Promise(function(resolve, reject) {
    var req = new XMLHttpRequest(),
        indexUrl = baseUrl + engine.indexPath;

    req.addEventListener('load', function() {
      var rawJson;

      try {
        rawJson = JSON.parse(this.responseText);
        resolve({
          urlToDoc: rawJson.urlToDoc,
          index: lunr.Index.load(rawJson.index)
        });
      } catch (err) {
        reject(new Error('failed to parse ' + indexUrl));
      }
    });
    req.open('GET', indexUrl);
    req.send();
  });
};

SearchEngine.prototype.parseSearchQuery = function(queryUrl) {
  return querystring.parse(url.parse(queryUrl).query)[this.queryParam];
};

SearchEngine.prototype.getResults = function(query, searchIndex) {
  var results = searchIndex.index.search(query);

  results.forEach(function(result) {
    var urlAndTitle = searchIndex.urlToDoc[result.ref];

    Object.keys(urlAndTitle).forEach(function(key) {
      result[key] = urlAndTitle[key];
    });
  });
  return results;
};

SearchEngine.prototype.executeSearch = function(baseUrl, queryUrl) {
  var searchEngine = this;
  return searchEngine.fetchIndex(baseUrl)
    .then(function(searchIndex) {
      var query = searchEngine.parseSearchQuery(queryUrl),
          results = searchEngine.getResults(query, searchIndex);
      return Promise.resolve({ query: query, results: results });
    });
};
