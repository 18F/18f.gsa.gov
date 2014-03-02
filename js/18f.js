$(document).ready(function() {
  // load posts from tumblr
  $.ajax({
    url: 'http://api.tumblr.com/v2/blog/18fblog.tumblr.com/posts/text?notes_info=true&limit=2&api_key=cA9agkd1WdAsFUFL5iq1Wnn0m4Dmcv5vf5otES3Ou08r2D3Ldu',
    type: 'GET',
    contentType: 'application/json',
    dataType: 'jsonp',
    jsonpCallback: 'jsonp',
    success: function (result) {
      for (i in result.response.posts) {
        // render post to the page
        console.log(result.response.posts[i]);
      }
    },
    error: function (e) {
      // An error occurred contacting tumblr
    }
  });
});
