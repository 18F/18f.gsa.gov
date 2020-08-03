'use strict';

module.exports = SearchUi;

// eslint-disable-next-line
// based on https://github.com/angular/angular.js/blob/54ddca537/docs/app/src/search.js#L198-L206
function SearchUi(doc, options) {
  var opts = options || {};

  this.doc = doc;
  this.inputElement = doc.getElementById(
    opts.inputElementId || SearchUi.DEFAULT_SEARCH_INPUT_ID);
  this.resultsElement = doc.getElementById(
    opts.searchResultsId || SearchUi.DEFAULT_SEARCH_RESULTS_ID);
  this.emptyResultsMessagePrefix = opts.emptyResultsMessagePrefix ||
    SearchUi.DEFAULT_EMPTY_RESULTS_MESSAGE_PREFIX;
  this.emptyResultsElementType = opts.emptyResultsElementType ||
    SearchUi.DEFAULT_EMPTY_RESULTS_ELEMENT_TYPE;
  this.emptyResultsElementClass = opts.emptyResultsElementClass ||
    SearchUi.DEFAULT_EMPTY_RESULTS_ELEMENT_CLASS;
}

SearchUi.DEFAULT_SEARCH_INPUT_ID = 'search-input';
SearchUi.DEFAULT_SEARCH_RESULTS_ID = 'search-results';
SearchUi.DEFAULT_EMPTY_RESULTS_MESSAGE_PREFIX = 'No results found for';
SearchUi.DEFAULT_EMPTY_RESULTS_ELEMENT_TYPE = 'p';
SearchUi.DEFAULT_EMPTY_RESULTS_ELEMENT_CLASS = 'search-empty';

function isForwardSlash(keyCode) {
  return keyCode === 191;
}

function isInput(element) {
  return element.tagName.toLowerCase() === 'input';
}

SearchUi.prototype.enableGlobalShortcut = function() {
  var doc = this.doc,
      inputElement = this.inputElement;

  doc.body.onkeydown = function(event) {
    if (isForwardSlash(event.keyCode) && !isInput(doc.activeElement)) {
      event.stopPropagation();
      event.preventDefault();
      inputElement.focus();
      inputElement.select();
    }
  };
};

SearchUi.prototype.renderResults = function(query, results, renderResults) {
  if (!query) {
    return;
  }
  this.inputElement.value = query;

  if (results.length === 0) {
    this.createEmptyResultsMessage(query);
    this.inputElement.focus();
  }
  renderResults(query, results, this.doc, this.resultsElement);
};

SearchUi.prototype.createEmptyResultsMessage = function(query) {
  var item = this.doc.createElement(this.emptyResultsElementType),
      message = this.doc.createTextNode(
        this.emptyResultsMessagePrefix + ' "' + query + '".'),
      parentItem = this.resultsElement.parentElement;

  item.style.className = this.emptyResultsElementClass;
  item.appendChild(message);
  parentItem.insertBefore(item, this.resultsElement);
};
