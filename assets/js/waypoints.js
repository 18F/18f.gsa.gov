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

  function directionDown(relatedElement) {
    return function(direction) {
      $navItems
        .removeClass('usa-current', direction === 'down');
      if ($window.scrollTop() !== 0) {
        getRelatedNavigation(this)
          .addClass('usa-current', direction === 'down');
      }
    }
  }

  function directionUp(relatedElement) {
    return function(direction) {
      $navItems.removeClass('usa-current', direction === 'up');
      if ($window.scrollTop() !== 0) {
        getRelatedNavigation(relatedElement)
          .addClass('usa-current', direction === 'up');
      }
    }
  }

  function waypointMapper(elements) {
    var waypointDown = elements.map(function(element) {
      var elementId = element.replace('#', '');
      var upHandler = directionUp(element);
      var downHandler = directionDown(element);

      var waypointDown = new Waypoint({
        element: document.getElementById(elementId),
        handler: downHandler,
        offset: function() {
          return $(element).height();
        }
      })

      var waypointUp = new Waypoint({
        element: document.getElementById(elementId),
        handler: upHandler,
        offset: function() {
          return -$(element).height();
        }
      })
    })
  }

  waypointMapper(anchors)
  // Subnav click to top
  $('.nav-accordion-button-desktop').on('click', function() {
    $window.scrollTop(0, 0);
  });
});
