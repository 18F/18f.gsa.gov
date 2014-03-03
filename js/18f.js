$(document).ready(function() {
  // load posts from tumblr
  $.ajax({
    url: 'http://api.tumblr.com/v2/blog/peacecorps.tumblr.com/posts/text?notes_info=true&limit=3&filter=text&api_key=cA9agkd1WdAsFUFL5iq1Wnn0m4Dmcv5vf5otES3Ou08r2D3Ldu',
    type: 'GET',
    contentType: 'application/json',
    dataType: 'jsonp',
    jsonpCallback: 'jsonp',
    success: function (result) {
      for (i in result.response.posts) {
        // render post to the page
        var post = result.response.posts[i]
        console.log(post);
        $('#blog' + i + ' .blog-title').html(post.title);
        $('#blog' + i + ' .blog-title').attr('href', post.post_url);
        $('#blog' + i + ' .blog-date').html(post.date);
        $('#blog' + i + ' .blog-snippet').html(post.body);
        var tagHtml = '';
        for (j in post.tags) {
          if (j !== 0) {
            tagHtml += ', ';
          }
          tagHtml += '<a href="' + '#' + '">' + post.tags[j] + '</a>';
        }
        $('#blog' + i + ' .blog-tags').html(tagHtml);
        $('#blog' + i).show();
      }
    },
    error: function (e) {
      // An error occurred contacting tumblr
    }
  });
});
