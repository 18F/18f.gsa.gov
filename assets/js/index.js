$(function (){
  $('.menu-btn, .overlay, .sliding-panel-close').on('click touchstart', function (e) {
    $('.nav-mobile, .overlay').toggleClass('is-visible');
    e.preventDefault();
  });
});
