//= require jquery
//= require jquery_ujs
//= require turbolinks

//= require jquery.fitvids
//= require holder
//= require urlify
//= require jquery.isotope
//= require_tree .

jQuery ->
  $(document).on 'page:fetch', -> $('#main').fadeOut 'slow'
  $(document).on 'page:change', -> $('#main').hide().fadeIn 'slow'