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

StacksyApp.setup = function() {
  $('.message-button').unbind('click');
  $('.message-box').hide();
  $('.message-button').click(function(){
    $(this).parent().children('.message-box').slideToggle();
  });
  $('.message-button').click(function(){
    $(this).parents('tr').children('td:nth-child(4)').children('.message-box').slideToggle();
  });
  StacksyApp.ageslider();
};

StacksyApp.ageslider = function(){
  $("#slider").slider({
    range: true,
    min: 18,
    mas: 99,
    values: [18,50],
    slide: function(event, ui){
      $("#amount").val(ui.values[0] + "-" + ui.values[1]);
    },
    change: function(event, ui){
      $("#q_birthday_lteq").val(ui.values[0]),
      $("#q_birthday_gteq").val(ui.values[1])
    }

  });
  $("#amount").val($("#slider").slider("values",0) + "-" + $("#slider").slider("values", 1));
};

$(StacksyApp.setup);

