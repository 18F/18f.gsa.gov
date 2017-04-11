$(function () {
  // Get link by section or article id
  function getRelatedNavigation(el) {
    return $('.nav-subnav a[href*=' + $(el).attr('id') + ']');
  }

  var $navItems = $('.nav-subnav a')
    .filter( ".usa-sidenav-list > li > a" );

  var $window = $(window);
  var anchors = $.map($navItems, function(item) {
    return item.getAttribute('href')
      .replace(window.location.pathname, '');
  });

  anchors = anchors.filter(function(anchor) {
    return anchor[0] === '#';
  });

  var $anchors = $(anchors.join(','));
  $anchors
    .waypoint(function(direction) {
      $navItems
        .removeClass('usa-current', direction === 'down');
      if ($window.scrollTop() !== 0) {
        getRelatedNavigation(this)
          .addClass('usa-current', direction === 'down');
      }
    }, {
      offset: function() {
        return $(this).height();
      }
    })
    .waypoint(function(direction) {
      $navItems.removeClass('usa-current', direction === 'up');
      if ($window.scrollTop() !== 0) {
        getRelatedNavigation(this)
          .addClass('usa-current', direction === 'up');
      }
    }, {
      offset: function() {
        return -$(this).height();
      }
    });

  // Subnav click to top
  $('.nav-accordion-button-desktop').on('click', function() {
    $window.scrollTop(0, 0);
  });
});
