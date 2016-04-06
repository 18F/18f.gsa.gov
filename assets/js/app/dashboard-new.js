(function(){

  $('#projects').mixItUp();

  $('.filter').click(function(e) {
    $('.filter').removeClass('btn-primary');
    $(this).addClass('btn-primary');
  });

})();