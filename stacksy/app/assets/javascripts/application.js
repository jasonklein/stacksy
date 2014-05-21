// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


var StacksyApp = StacksyApp || {};

StacksyApp.messageBoxToggle = function(content) {
  if (content.data('state') === 'hidden') {
    content.slideDown();
    content.data('state', 'visible');
  } else if (content.data('state') === 'visible') {
    content.slideUp();
    content.data('state', 'hidden');
  };
}

StacksyApp.setup = function() {
  $('.message-box').data('state', 'hidden').hide();
  $('.message-button').click(function(){
    StacksyApp.messageBoxToggle($(this).parent().children('.message-box'));
  });
  $('.reply-button').click(function(){
    StacksyApp.messageBoxToggle($(this).parents('tr').children('td:nth-child(4)').children('.message-box'));
  });
}



$(StacksyApp.setup);

