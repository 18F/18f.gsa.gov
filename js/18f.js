$(document).ready(function () {
  // load posts from tumblr
  var blog = '18fblog.tumblr.com';
  var months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  // leaving the site modal
/*  var leaveSite = function (e) {
    if (e.preventDefault) e.preventDefault();
    var link = $(e.currentTarget).attr('href');
    $("#linkModal .targetLink").attr('href',link);
    $("#linkModal .targetLink").html(link);
    $("#linkModal .btn-primary").attr('href', link);
    var countdown = 5;
    $("#linkModal .targetTime").html(countdown);
    $("#linkModal").modal('show');    
    var doCountdown = function () {
      // abort if the modal has been closed
      if (!($("#linkModal").hasClass('in'))) {
        return;
      }
      countdown--;
      $("#linkModal .targetTime").html(countdown);
      if (countdown > 0) {
        setTimeout(doCountdown, 1000);
      } else {
        $("#linkRedirect").html("Here we go!");
        window.location = link;
      }
    };
    setTimeout(doCountdown, 1000);
  };
  $(".link").click(leaveSite);
  $('.photo-credit').mouseenter(function () { // little hack to bind leaveSite to photo-credit
    $(".link").click(leaveSite);
  });*/

  // get tumblr posts
  $.ajax({
    url: '//api.tumblr.com/v2/blog/' + blog + '/posts/text?notes_info=true&limit=3&filter=text&api_key=cA9agkd1WdAsFUFL5iq1Wnn0m4Dmcv5vf5otES3Ou08r2D3Ldu',
    type: 'GET',
    contentType: 'application/json',
    dataType: 'jsonp',
    jsonpCallback: 'jsonp',
    success: function (result) {
      $("#blog-loading").hide();
      for (i in result.response.posts) {
        // render post to the page
        var post = result.response.posts[i];
        $('#blog' + i + ' .blog-title').html(post.title);
        $('#blog' + i + ' .blog-title').attr('href', post.post_url);
        $('#blog' + i + ' .blog-text').html(post.body);
        $('#blog' + i + ' .readmore').attr('href', post.post_url);
        var tagHtml = '';
        for (j in post.tags) {
          if (j != 0) {
            tagHtml += ', ';
          }
          tagHtml += '<a href="http://' + blog + '/tagged/' + encodeURIComponent(post.tags[j]) + '" class="link">' + post.tags[j] + '</a>';
        }
        $('#blog' + i + ' .blog-tags').html(tagHtml);
        var d = new Date(post.timestamp * 1000);
        var date = months[d.getMonth()] + ' ' + d.getDate() + ', ' + d.getFullYear();
        $('#blog' + i + ' .blog-date').html(date);
        $('#blog' + i).show();
      }
      $(".blog-snippet").dotdotdot({
        watch: "window",
        after: "a.readmore"
      });
      //$(".link").click(leaveSite);
    },
    error: function (e) {
      $("#blog-loading .error").show();
    }
  });


  // linear fade-ins
  $('.fadeIn').each(function (e) { 
    $(this).addClass('fade-'+e);
    var t = setTimeout("$('.fade-"+e+"').fadeIn(500)",500*e);
  });

  // team hover effect
  $('.bio').mouseenter(function () {
    var $img = $(this).find('.team-img');
    $img.data('original',$img.attr('src'));
    $(this).append('<img class="hover-img img-circle" src="' + $img.data('color') + '" />');
    var $hover_img = $(this).find('.hover-img');
    $hover_img.width($img.width()).height($img.height());
    $hover_img.animate({
      opacity: 1
    }, 'fast');
  }).mouseleave(function () {
    var $img = $(this).find('.team-img');
    $(this).find('.hover-img').fadeOut('slow',function () {
      $(this).remove();
    });
  });

  // img preloader
  $('body').append('<div id="preloader"></div>');
  $('.bio').find('img').each( function() {
    var src = $(this).data('color');
    var $pre = $('#preloader');
    $pre.append("<img src='" + src + "' />");
  });

  // slider preloader
  $('#slideshow .slide').each( function() {
    var src = ($(this).css('background-image'));
    src = src.replace('url(','').replace(')','');
    var $pre = $('#preloader');
    $pre.append("<img src='" + src + "' />");
  });
});

// IE Form Placeholders 
    $(function() {
    if(!$.support.placeholder) { 
      var active = document.activeElement;
      $(':text').focus(function () {
        if ($(this).attr('placeholder') != '' && $(this).val() == $(this).attr('placeholder')) {
          $(this).val('').removeClass('hasPlaceholder');
        }
      }).blur(function () {
        if ($(this).attr('placeholder') != '' && ($(this).val() == '' || $(this).val() == $(this).attr('placeholder'))) {
          $(this).val($(this).attr('placeholder')).addClass('hasPlaceholder');
        }
      });
      $(':text').blur();
      $(active).focus();
      $('form').submit(function () {
        $(this).find('.hasPlaceholder').each(function() { $(this).val(''); });
      });
    }
    });

