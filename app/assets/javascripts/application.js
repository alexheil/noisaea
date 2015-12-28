// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

//var fadeAlert = function() {
  //$('.flash_js').delay(7000).fadeOut(500);
//};

//$(document).ready(fadeAlert);
//$(document).on('page:load', fadeAlert);

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
    $('.crescent').toggle();
  });

  $('.buffalo').click(function() {
    $('.taunton').hide(300);
    $('.crescent').show();
  });

};

$(document).ready(headerShow);
$(document).on('page:load', headerShow);
