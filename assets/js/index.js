/* eslint-env jquery */
$(function (){
  var TABBABLE_SELECTOR = [
    'a[href]',
    'area[href]',
    'input:not([disabled])',
    'select:not([disabled])',
    'textarea:not([disabled])',
    'button:not([disabled])',
    'iframe',
    'object',
    'embed',
    '[tabindex="0"]',
    '[contenteditable]'
  ].join();

  // Onclick window location handler
  $('.card-link').on('click', function(e) {
    var url = $(this).data().href;
    if (e.shiftKey || e.ctrlKey || e.metaKey) {
      window.open(url, '_blank');
    } else {
      window.location = url;
    }
  });

  function toggleMenu(isOpen) {
    $('.nav-mobile, .overlay').toggleClass('is-visible', isOpen);
    $('.menu-btn').attr('aria-expanded', isOpen);
    var focusTarget = $(isOpen ? '#sitenav' : '.menu-btn');
    focusTarget.focus();
  }

  // Drawer
  $('.menu-btn, .overlay, .sliding-panel-close').on('click touchstart', function (e) {
    var isCurrentlyOpen = $('.nav-mobile').hasClass('is-visible');
    toggleMenu(!isCurrentlyOpen);
    e.preventDefault();
  });

  $('#sitenav').on('keydown', function(event) {
    switch (event.which) {
      case 27: // Escape
        toggleMenu(false);
        break;
    }
  });

  // Styleguide drawer
  $('.menu-btn-styleguide, .sliding-panel-close-styleguide').on('click touchstart', function (e) {
    $('.nav-mobile-styleguide').toggleClass('is-visible');
    e.preventDefault();
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

  $('.search-interface').on("submit", function(){
    $("#search-loading").show();
  })
});
