var fanScript = function() {

  var fanContainer = $('.ferry, .colvin')

  $('#fan-artist-click').click(function() {
    fanContainer.hide(300);
    $('#fan-artist').show(300);
  });

  $('#fan-record-label-click').click(function() {
    fanContainer.hide(300);
    $('#fan-record-label').show(300);
  });

  $('#fan-venue-click').click(function() {
    fanContainer.hide(300);
    $('#fan-venue').show(300);
  });

  $('#fan-producer-click').click(function() {
    fanContainer.hide(300);
    $('#fan-producer').show(300);
  });

};

$(document).ready(fanScript);
$(document).on('page:load', fanScript);
