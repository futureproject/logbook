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
//= require fastclick
//= require selectize
//= require_self

$(function(){
  new FastClick(document.body)
  $(document).on('click', 'a', function(e){
    if (navigator.standalone) {
      e.preventDefault()
      location.href = this.href
    }
  }).on('click', '.flash', function(e) {
    $(this).fadeOut()
  })
  $('body').each(function(){
    if(!navigator.standalone) this.classList.add('browser')
  })
})
