var lunr = require('./lunr.min');
var input = '';

function buildIndex(corpus, indexFields) {
  var index,
      urlToDoc = {};
  
  index = lunr(function() {
    var boost;

    this.ref('url');

    for (var fieldName in indexFields) {
      boost = indexFields[fieldName];
      this.field(fieldName, boost);
    }
  });

  corpus.entries.forEach(function(page) {
    if (page.skip_index !== true) {
      index.add(page);
      urlToDoc[page.url] = {url: page.url, title: page.title};
    }
  });

  return JSON.stringify({
    index: index.toJSON(),
    urlToDoc: urlToDoc
  });
}

process.stdin.setEncoding('utf8');

process.stdin.on('data', function(data) {
  input = input + data;
});

process.stdin.on('end', function() {
  input = JSON.parse(input);
  process.stdout.write(buildIndex(input.corpus, input.indexFields));
});
