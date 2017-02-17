$(function (){
  // Drawer
  $('.menu-btn, .overlay, .sliding-panel-close').on('click touchstart', function (e) {
    $('.nav-mobile, .overlay').toggleClass('is-visible');
    e.preventDefault();
  });

  // Subnav crawling
  var $navItems = $('.nav-subnav a');

  // Get link by section or article id
  function getRelatedNavigation(el){
    return $('.nav-subnav a[href*=' + $(el).attr('id') + ']');
  }

  var $navItems = $('.nav-subnav a');
  var anchors = $.map($navItems, function(item) {
    return item.getAttribute('href').replace(window.location.pathname, '');
  });

  var $anchors = $(anchors.join(','));

  var waypoints = $anchors
    .waypoint(function(direction) {
      $navItems.removeClass('usa-current', direction === 'down');
      getRelatedNavigation(this).addClass('usa-current', direction === 'down');
    }, {
      offset: function() {  return $(this).height(); }
    })
    .waypoint(function(direction) {
      $navItems.removeClass('usa-current', direction === 'up');
      getRelatedNavigation(this).addClass('usa-current', direction === 'up');
    }, {
      offset: function() {  return -$(this).height(); }
    });

  //
  console.log('yo')
  // I only have one form on the page but you can be more specific if need be.
  var $form = $('#contact-form');

  if ( $form.length > 0 ) {
      $('#contact-form input[type="submit"]').bind('click', function ( event ) {
          console.log('click')
          if ( event ) event.preventDefault();
          // validate_input() is a validation function I wrote, you'll have to substitute this with your own.
          // if ( validate_input($form) ) { register($form); }
          register($form);
      });
  }

  function register($form) {
    $.ajax({
        type: $form.attr('method'),
        url: $form.attr('action'),
        data: $form.serialize(),
        dataType: 'jsonp',
        cache       : false,
        dataType    : 'json',
        contentType: "application/json; charset=utf-8",
        error       : function(err) { alert("Could not connect to the registration server. Please try again later."); },
        success     : function(data) {
            if (data.result != "success") {
                // Something went wrong, do something to notify the user. maybe alert(data.msg);
            } else {
                // It worked, carry on...
            }
        }
    });
  }
});
