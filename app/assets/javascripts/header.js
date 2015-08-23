var headerShow = function() {

  $('#emslie').click(function() {
    $('.monroe').toggle(300);
  });

  $('#watson').click(function() {
    $('.madison').toggle(300);
  });

  $('.adams').click(function() {
    $(this).closest('.south-ogden').next('.madison').toggle(300);
  });

  $('.adams').click(function() {
    $('.grey').toggle(300);
  });

  $('.starin').click(function() {
    $('.taunton').toggle(300);
  });

};

$(document).ready(headerShow);
$(document).on('page:load', headerShow);
