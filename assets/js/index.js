/* eslint-env jquery */
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
  $('.overlay, .sliding-panel-close')
    .on('click touchstart', function(e) {
      $('.nav-mobile, .overlay').toggleClass('is-visible');
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

  // Side Nav

  // Set accordion state on load
  function setSubnav() {
    let subnavButton;
    const screenWidth = window.innerWidth;
    const subnavButtons = document.querySelectorAll('[aria-controls=subnav-list]');
    const subnavContent = document.getElementById('subnav-list');

    if (subnavButtons.length > 0) {
      subnavButton = subnavButtons[0];
    }

    if (subnavButton && screenWidth < 640) {
      subnavButton.setAttribute('aria-expanded', false);
      subnavContent.setAttribute('hidden', '');
    }

    if (subnavButton && screenWidth >= 640) {
      subnavButton.setAttribute('aria-expanded', true);
      subnavContent.removeAttribute('hidden');
    }
  }

  // Set accordion onload
  setSubnav();

  // Set accordion collapse while resize on max size tablet
  window.addEventListener('resize', setSubnav);
});
