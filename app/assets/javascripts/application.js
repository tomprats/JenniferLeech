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
//= require jquery.form
//= require bootstrap
//= require_tree .

function flash(message) {
  if($(".flash").length > 1) {
    $alert = $(".flash");
  } else {
    $alert = $(".alerts").clone();
    $alert.removeClass("alerts hide");
    $(".alerts").after($alert);
  }
  $alert.find(".replace").text(message);
}

function clearFlash() {
  $(".alerts hide").removeClass("flash");
  $(".flash").remove();
  $(".alerts hide").addClass("flash");
}
