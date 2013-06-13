#= require jquery
#= require turbolinks
#= require jquery.fitvids
#= require holder
#= require urlify
#= require jquery.isotope
#= require_tree .

init = ->
  $('iframe#vimeo').css 'visibility', 'hidden'
  $('iframe#vimeo').load -> $(this).fadeIn()

  $('#main .tile').hide()
  loaded()

loaded = ->
  $('#main .tile').each (index) ->
    $(this).delay(index * 200).fadeIn 'slow'

jQuery ->
  $(document).on 'page:fetch', ->
    $('#main .tile').reverse().each (index) ->
      $(this).delay(index * 200).fadeOut 'slow'

  $(document).on 'page:change', init

  init()
