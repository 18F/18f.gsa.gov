$(function (){
  // Onclick window location handler
  $('.card-link').on('click', function(e) {
    var url = $(this).data().href;
    if (e.shiftKey || e.ctrlKey || e.metaKey) {
      window.open(url, '_blank');
    } else {
      window.location = url;
    }
  });

  // Drawer
  $('.menu-btn, .overlay, .sliding-panel-close').on('click touchstart', function (e) {
    $('.nav-mobile, .overlay').toggleClass('is-visible');
    e.preventDefault();
  });

  // Styleguide drawer
  $('.menu-btn-styleguide, .sliding-panel-close-styleguide').on('click touchstart', function (e) {
    $('.nav-mobile-styleguide').toggleClass('is-visible');
    e.preventDefault();
  });

  // Subnav crawling
  var $navItems = $('.nav-subnav a');
  var $window = $(window);

  // Get link by section or article id
  function getRelatedNavigation(el){
    return $('.nav-subnav a[href*=' + $(el).attr('id') + ']');
  }

  var $navItems = $('.nav-subnav a');
  var anchors = $.map($navItems, function(item) {
    return item.getAttribute('href')
      .replace(window.location.pathname, '');
  });

  var $anchors = $(anchors.join(','));

  var waypoints = $anchors
    .waypoint(function(direction) {
      $navItems.removeClass('usa-current', direction === 'down');
      if ($window.scrollTop() !== 0) {
        getRelatedNavigation(this).addClass('usa-current', direction === 'down');
      }
    }, {
      offset: function() {  return $(this).height(); }
    })
    .waypoint(function(direction) {
      $navItems.removeClass('usa-current', direction === 'up');
      if ($window.scrollTop() !== 0) {
        getRelatedNavigation(this).addClass('usa-current', direction === 'up');
      }
    }, {
      offset: function() {  return -$(this).height(); }
    });

  // Subnav click to top
  $('.nav-accordion-button-desktop').on('click', function() {
    $window.scrollTop(0, 0);
  });

  // Mailchimp
  var $form = $('#contact-form'),
    $newsletter = $('#newsletter'),
    $newsletterSuccess = $('#newsletter-success'),
    $newsletterEmail = $('#newsletter-email');

  var defaultNewsletterText = $newsletter.text();

  var newsletterForm = {
    response: function () {
      var email = $newsletterEmail.val();
      $('#newsletter-response').text(email);
      $form.hide();
      $newsletterSuccess.show();
    },
    reset: function (argument) {
      $newsletter.text(defaultNewsletterText);
      $newsletterEmail.val('');
      $form.show();
      $newsletterSuccess.hide();
      $newsletterEmail.focus();
    }
  }

  $form.ajaxChimp({
    callback: callbackFunction
  });

  function callbackFunction (resp) {
    if (resp.result === 'success') {
      newsletterForm.response();
    }
  }

  $('#button-reset').on('click', function () {
    newsletterForm.reset();
  });
});
