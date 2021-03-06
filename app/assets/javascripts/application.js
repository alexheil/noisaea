//= require jquery
//= require jquery_ujs
//= require jquery-fileupload/basic-plus
//= require_tree .

var micropostComments = function() {
  $('.microposts_js').on("click", ".linden", function() {
    $(this).closest('.lisbon').next('.walden').slideToggle(300);
  });

  $('.linden').click(function() {
    $(this).closest('#lisbon').next('.walden').slideToggle(300);
  });

  $('.linden').click(function() {
    $(this).closest('.harlem').next('.walden').slideToggle(300);
  });

  $('.microposts_form').on("click", '.tennyson', function() {
    $('.virgil').slideToggle(300);
  });

  $('.microposts_form').on("click", '.homer', function() {
    $('.lovering').slideToggle(300);
  });

};

$(document).ready(micropostComments);
$(document).on('page:load', micropostComments);


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


var artistGenres = function() {

  var genreContainer = $('.ferry, .colvin')
  var genreTitle = $('.porter')

  $('#all-genres').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-all-genres').toggle();
  });

  $('#alternative').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-alternative').toggle();
  });

  $('#ambient').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-ambient').toggle();
  });

  $('#blues').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-blues').toggle();
  });

  $('#classical').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-classical').toggle();
  });

  $('#comedy').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-comedy').toggle();
  });

  $('#country').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-country').toggle();
  });

  $('#electronic').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-electronic').toggle();
  });

  $('#experimental').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-experimental').toggle();
  });

  $('#hip-hop-rap').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-hip-hop-rap').toggle();
  });

  $('#indie').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-indie').toggle();
  });

  $('#jazz').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-jazz').toggle();
  });

  $('#latino').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-latino').toggle();
  });

  $('#metal').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-metal').toggle();
  });

  $('#pop').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-pop').toggle();
  });

  $('#rb-soul').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-rb-soul').toggle();
  });

  $('#rock').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-rock').toggle();
  });

  $('#singer-songwriter').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-singer-songwriter').toggle();
  });

  $('#soundtrack').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-soundtrack').toggle();
  });

  $('#world').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-world').toggle();
  });

  $('#recent').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-recent').toggle();
  });

  $('#popular').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-popular').toggle();
  });

  $('#location').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-location').toggle();
  });

  $('#mall-genres').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-all-genres').toggle();
  });

  $('#malternative').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-alternative').toggle();
  });

  $('#mambient').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-ambient').toggle();
  });

  $('#mblues').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-blues').toggle();
  });

  $('#mclassical').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-classical').toggle();
  });

  $('#mcomedy').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-comedy').toggle();
  });

  $('#mcountry').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-country').toggle();
  });

  $('#melectronic').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-electronic').toggle();
  });

  $('#mexperimental').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-experimental').toggle();
  });

  $('#mhip-hop-rap').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-hip-hop-rap').toggle();
  });

  $('#mindie').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-indie').toggle();
  });

  $('#mjazz').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-jazz').toggle();
  });

  $('#mlatino').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-latino').toggle();
  });

  $('#mmetal').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-metal').toggle();
  });

  $('#mpop').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-pop').toggle();
  });

  $('#mrb-soul').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-rb-soul').toggle();
  });

  $('#mrock').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-rock').toggle();
  });

  $('#msinger-songwriter').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-singer-songwriter').toggle();
  });

  $('#msoundtrack').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-soundtrack').toggle();
  });

  $('#mworld').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-world').toggle();
  });

  $('#mrecent').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-recent').toggle();
  });

  $('#mpopular').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-popular').toggle();
  });

  $('#mlocation').click(function() {
    genreTitle.removeClass('lafayette');
    $(this).addClass('lafayette');
    genreContainer.hide();
    $('#container-location').toggle();
  });

};

$(document).ready(artistGenres);
$(document).on('page:load', artistGenres);


var headerShow = function() {

  $('.adams').click(function() {
    $('.grey').toggle(300);
  });

  $('.starin').click(function() {
    $('.taunton').toggle();
    $('.crescent').toggle();
    $(this).parent().toggleClass('test');
  });

  $('.buffalo').click(function() {
    $('.taunton').hide();
    $('.crescent').show();
  });

  $('#closemenu').click(function() {
    $('.taunton').toggle();
    $(this).parent().parent().toggleClass('test');
  });

};

$(document).ready(headerShow);
$(document).on('page:load', headerShow);


var showArtists = function() {

  $('#plus').click(function() {
    $(this).hide();
    $('#plus1').show();
    $('#show_field2').show(300);
  });

  $('#plus1').click(function() {
    $(this).hide();
    $('#plus2').show();
    $('#show_field3').show(300);
  });

  $('#plus2').click(function() {
    $(this).hide();
    $('#plus3').show();
    $('#show_field4').show(300);
  });

  $('#plus3').click(function() {
    $(this).hide();
    $('#plus4').show();
    $('#show_field5').show(300);
  });

  $('#plus4').click(function() {
    $(this).hide();
    $('#plus5').show();
    $('#show_field6').show(300);
  });

  $('#plus5').click(function() {
    $(this).hide();
    $('#plus6').show();
    $('#show_field7').show(300);
  });

  $('#plus6').click(function() {
    $(this).hide(100);
    $('#show_field8').show(300);
  });

};

$(document).ready(showArtists);
$(document).on('page:load', showArtists);

var merchLightbox = function() {

  $('.micropost_share').on("click", "#back", function() {
    $('#back').hide();
    $('#front').hide();
    $('#close').hide();
    $('.buffalo').removeClass('blur');
    $('.englewood').removeClass('blur');
  });

  $('.micropost_share').on("click", "#close", function() {
    $('#back').hide();
    $('#front').hide();
    $('#close').hide();
    $('.buffalo').removeClass('blur');
    $('.englewood').removeClass('blur');
  });

  $('#riley').click(function() {
    $('#back').show();
    $('#front').show();
    $('#close').show();
    $('.buffalo').addClass('blur');
    $('.englewood').addClass('blur');
  });

  $('#back').click(function() {
    $('#back').hide();
    $('#front').hide();
    $('.prepurchaseform').hide();
    $('.buffalo').removeClass('blur');
    $('.englewood').removeClass('blur');
  });

  $('#close').click(function() {
    $('#back').hide();
    $('#front').hide();
    $('.prepurchaseform').hide();
    $('.buffalo').removeClass('blur');
    $('.englewood').removeClass('blur');
  });

  $('#front').click(function() {
    $('#back').hide();
    $('#front').hide();
    $('.buffalo').removeClass('blur');
    $('.englewood').removeClass('blur');
  });

  $('.lightbox-image').click(function() {
    $('#back').hide();
    $('#front').hide();
    $('.buffalo').removeClass('blur');
    $('.englewood').removeClass('blur');
  });

  $('.prepurchaseformbutton').click(function() {
    $('#back').show();
    $('.prepurchaseform').show();
  });

};

$(document).ready(merchLightbox);
$(document).on('page:load', merchLightbox);

var musicPlayer = function() {

  var music = $('#audioplayer').get(0);
  var duration;
  var pButton = $('#pButton').get(0);
  var playhead = $('#playhead').get(0);
  var timeline = $('#timeline').get(0);
  var timelineWidth = $('#timeline').width() - $('#playhead').width();

  $('#audioplayer').bind("timeupdate", timeUpdate);

  $('#timeline').click(function(event) {
    moveplayhead(event);
    music.currentTime = duration * clickPercent(event);
  });

  function clickPercent(e) {
    return (e.pageX - $('#timeline').offset().left) / timelineWidth;
  }

  $('#playhead').bind('mousedown', mouseDown);

  $(window).bind('mouseup', mouseUp);

  var onplayhead = false;

  function mouseDown() {
    onplayhead = true;
    $(window).bind('mousemove', moveplayhead);
    $('#audioplayer').bind('timeupdate', timeUpdate);
  }

  function mouseUp(e) {
    if (onplayhead == true) {
      moveplayhead(e);
      $(window).unbind('mousemove', moveplayhead);
      music.currentTime = duration * clickPercent(e);
      $('#audioplayer').bind('timeupdate', timeUpdate);
    }
    onplayhead = false;
  }

  function moveplayhead(e) {
    var newMargLeft = e.pageX - $('#timeline').offset().left;
    if (newMargLeft >= 0 && newMargLeft <= timelineWidth) {
      playhead.style.marginLeft = newMargLeft + "px";
    }
    if (newMargLeft < 0) {
      playhead.style.marginLeft = "0px";
    }
    if (newMargLeft > timelineWidth) {
      playhead.style.marginLeft = timelineWidth + "px";
    }
  }

  function timeUpdate() {
    var playPercent = timelineWidth * (music.currentTime / duration);
    playhead.style.marginLeft = playPercent + "px";
    if (music.currentTime == duration) {
      $('#pButton').removeClass('pause');
      $('#pButton').addClass('play');
    }
  }

  $('#pButton').click(function() {
    if (music.paused) {
      music.play();
      $('#pButton').removeClass('play');
      $('#pButton').addClass('pause');
    }
    else {
      music.pause();
      $('#pButton').removeClass('pause');
      $('#pButton').addClass('play');
    }
  });

  $('#audioplayer').bind('timeupdate', function() {
    var duration = music.duration;
    var sec = new Number();
    var min = new Number();
    sec = Math.floor( duration );
    min = Math.floor( sec / 60 );
    min = min >= 10 ? min : '0' + min;
    sec = Math.floor( sec % 60 );
    sec = sec >= 10 ? sec : '0' + sec;
    $("#total_duration").html(min + ":"+ sec);
  });

  $('#audioplayer').bind('timeupdate', function() {
    var duration = music.currentTime;
    var sec = new Number();
    var min = new Number();
    sec = Math.floor( duration );
    min = Math.floor( sec / 60 );
    min = min >= 10 ? min : '0' + min;
    sec = Math.floor( sec % 60 );
    sec = sec >= 10 ? sec : '0' + sec;
    $("#current_time").html(min + ":"+ sec);
  });

  $('#audioplayer').bind("canplaythrough", function() {
    duration = music.duration;
  });

};

$(document).ready(musicPlayer);
$(document).on('page:load', musicPlayer);


var lyricsAndTrack = function() {

  $('.artist-track-title').click(function() {
    var music = document.getElementById('audioplayer');
    var allLyrics = $('.show-lyrics');
    var hideLyrics = $('.hide-lyrics');
    var toggleLyrics = $('.toggle-lyrics');
    var actualLyrics = $('.lyrics');
    var trackDetails = $('.track-details');
    var trackSource = $(this).parent().find('.hide').html();
    var trackTitle = $(this).parent().find('.track-indv').text();
    allLyrics.hide();
    actualLyrics.hide();
    trackDetails.hide();
    hideLyrics.hide();
    toggleLyrics.hide();
    $(this).parent().find('.show-lyrics').show();
    $(this).parent().find('.track-details').show();
    $(this).parent().find('.toggle-lyrics').show();
    $('audio').attr('src', trackSource);
    $('#total_duration').text('00:00');
    $('.track-title').text(trackTitle);
    if (music.paused) {
      music.play();
      pButton.className = "";
      pButton.className = "pause";
    }
  });

  $('.hide-lyrics').click(function() {
    $(this).parent().find('.lyrics').hide(300);
    $(this).parent().find('.hide-lyrics').hide();
    $(this).parent().find('.toggle-lyrics').show();
  });

  $('.toggle-lyrics').click(function() {
    $(this).parent().find('.lyrics').show(300);
    $(this).parent().find('.toggle-lyrics').hide();
    $(this).parent().find('.hide-lyrics').show();
  });

};

$(document).ready(lyricsAndTrack);
$(document).on('page:load', lyricsAndTrack);


var directUpload = function() {

  var fileInput = $('.musicInput');
  var form = $(fileInput.parents('form:first'));
  var submitButton = form.find('input[type="submit"]');
  var uploadButton = $('.uploadButton');
  var uploadButtonIntructions = $('.uploadButtonIntructions');
  var progressBar = $("<div class='bar'></div>");
  var barContainer = $("<div class='progress'></div>").append(progressBar);
  fileInput.after(barContainer);
  fileInput.fileupload({
    fileInput: fileInput,
    url: form.data('url'),
    type: 'POST',
    autoUpload: false,
    formData: form.data('form-data'),
    paramName: 'file',
    dataType: 'XML',
    replaceFileInput: false,
    add: function (e, data) {
      uploadButton.show();
      uploadButtonIntructions.show();
      uploadButton.click(function() {
        data.submit();
      });
    },
    progress: function (e, data) {
      var progress = parseInt(data.loaded / data.total * 100, 10);
      progressBar.css('width', progress + '%')
    },
    start: function (e) {
      submitButton.prop('disabled', true);
      progressBar.
        css('background', 'green').
        css('display', 'block').
        css('width', '0%').
        text("Loading...");
    },
    done: function(e, data) {
      submitButton.prop('disabled', false);
      progressBar.text("Upload finished.");
      uploadButton.hide();
      uploadButtonIntructions.hide();
      var key   = $(data.jqXHR.responseXML).find("Key").text();
      var url   = form.data('url') + '/' + key;
      var input = $("<input />", { type:'hidden', name: fileInput.attr('name'), value: url })
      form.append(input);
    },
    fail: function(e, data) {
      submitButton.prop('disabled', false);
      progressBar.
        css("background", "red").
        text("Failed");
    }
  });

};

$(document).ready(directUpload);
$(document).on('page:load', directUpload);
