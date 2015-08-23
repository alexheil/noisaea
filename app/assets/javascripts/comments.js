var micropostComments = function() {
  $('.linden').click(function() {
    $(this).closest('.lisbon').next('.walden').toggle(300);
  });

  $('.linden').click(function() {
    $(this).closest('.harlem').next('.walden').toggle(300);
  });

};

$(document).ready(micropostComments);
$(document).on('page:load', micropostComments);
