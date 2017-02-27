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
});
