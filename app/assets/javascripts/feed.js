var fanFeed = function() {
  $('.tacoma').click(function() {
    $(this).closest('.hertel').next('.colvin').toggle(300);
  });

};

$(document).ready(fanFeed);
$(document).on('page:load', fanFeed);
