$(function (){
  // Get link by section or article id
  function getRelatedNavigation(el) {
    return $('.nav-subnav a[href*=' + $(el).attr('id') + ']');
  }

  function updateHash(el) {
    console.log('el-->', el)
    var hash = typeof(el) === 'string' ? el : $(el).attr('id')
    if(history.pushState) {
      history.replaceState(null, null, "#" + hash);
    }
    else {
      window.location.hash = "#" + hash;
    }
  }

  var $navItems = $('.nav-subnav a').filter( ".usa-sidenav-list > li > a" );

  var $window = $(window);
  var anchors = $.map($navItems, function(item) {
    return item.getAttribute('href')
      .replace(window.location.pathname, '');
  });

  anchors = anchors.filter(function(anchor) {
    return anchor[0] === '#';
  });

  var $anchors = $(anchors.join(','));
  var waypoints = $anchors
    .waypoint(function(direction) {
      $navItems.removeClass('usa-current', direction === 'down');
      if ($window.scrollTop() !== 0) {
        getRelatedNavigation(this).addClass('usa-current', direction === 'down');
        var self = this
        // setTimeout(function() {
        window.throttle(updateHash(this), 1000);
        // }, 500);
      }
    }, {
      offset: function() {  return $(this).height(); }
    })
    .waypoint(function(direction) {
      $navItems.removeClass('usa-current', direction === 'up');
      if ($window.scrollTop() !== 0) {
        getRelatedNavigation(this).addClass('usa-current', direction === 'up');
        var self = this
        // setTimeout(function() {
        window.throttle(updateHash(this), 1000);
        // }, 500);
      }
    }, {
      offset: function() {  return -$(this).height(); }
    });

  // Subnav click to top
  $('.nav-accordion-button-desktop').on('click', function() {
    updateHash('')
    $window.scrollTop(0, 0);
  });
});
