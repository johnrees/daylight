//= require jquery
//= require jquery_ujs
//= require turbolinks

//= require jquery.fitvids
//= require holder
//= require urlify
//= require jquery.isotope
//= require_tree .

init = ->
  $('iframe#vimeo').css 'visibility', 'hidden'
  $('iframe#vimeo').load -> $(this).fadeIn()
  $('#main').hide().fadeIn 'slow'

jQuery ->
  $(document).on 'page:fetch', -> $('#main').fadeOut 'slow'
  $(document).on 'page:change', init
  init()