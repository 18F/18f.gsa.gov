(function(){

  $('#projects').mixItUp();

  $('#filters select').change(function(e) {
    var val = e.target.value;
    if (val !== "all") val = ".f_" + val;
    $('#projects').mixItUp('filter', val);
  });

})();