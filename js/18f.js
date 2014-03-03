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


  var $slideshow = $('#slideshow')
  var $slides = $('#slideshow').find('img');
  var $photo_credit = $('.photo-credit');
  var $wrapper = $('.slideshow-wrapper');
  console.log('width: ' + $wrapper.width())
  console.log('height: ' + $wrapper.height())

  $slideshow.slidesjs({
    width: $wrapper.width(),
    height: $wrapper.height(),
    start: Math.floor((Math.random()*$slides.length)+1),
    effect: {
      fade: {
        speed: 800
      }
    },
    play: {
      active: false,
      auto: true,
      effect: 'fade'
    },
    interval: 2000,
    callback: {
      loaded: function(number) {
        var $slide = $($slides[number-1]);
        var caption = '<i class="icon-camera"></i> <span>'+$slide.attr('alt')+'</span>';
        $photo_credit.html(caption).fadeIn();
      },
      start: function(number) {
        $photo_credit.fadeOut();
      },
      complete: function(number) {
        // var $slide = $slides.get(number-1)
        var $slide = $($slides[number-1]);
        var caption = '<i class="icon-camera"></i> <span>'+$slide.attr('alt')+'</span>';
        $photo_credit.html(caption).fadeIn();
      }
    }
  });

  var slideshowResize = function() {
    var $wrapper = $('.slideshow-wrapper');
    var h = $wrapper.height();
    var w = $wrapper.width();

    $slideshow.width(w).height(h);
    $slideshow.find('.slide').css('min-height',h)
    $slideshow.find('.slide').css('min-width',w)
    return true;
  }

  slideshowResize();

  $(window).resize(function() {
    slideshowResize();
  });
});

