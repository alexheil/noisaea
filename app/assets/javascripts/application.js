//= require jquery
//= require jquery_ujs
//= require jquery-fileupload/basic-plus
//= require_tree .




var directUpload = function() {

  var fileInput = $('.musicInput');
  var form = $(fileInput.parents('form:first'));
  var submitButton = form.find('input[type="submit"]');
  var uploadButton = $('.uploadButton');
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
