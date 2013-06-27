#= require jquery
#= require turbolinks
#= require holder
#= require urlify
#= require jquery.isotope
#= require jquery.flexnav
#= require jquery.ba-throttle-debounce.js
#= require clients
#= require logo
#= require static
#= require videos

init = ->
  $('iframe#vimeo').css 'visibility', 'hidden'
  $('iframe#vimeo').load -> $(this).fadeIn()

  $('#main .tile').hide()
  loaded()

loaded = ->
  $('#main .tile').each (index) ->
    $(this).delay(index * 200).fadeIn 'slow'

scroll = ->


jQuery ->

  distance    = 60
  className   = 'scrolled'

  headerheight = $('header').height()

  # $.throttle( 50,
  $(document).on 'scroll', (event) ->
    scroll = parseInt $(window).scrollTop()
    if scroll <= 130
      $('header').toggleClass 'fixed', false
      $('header').css 'height', Math.max(130, headerheight - scroll)
      $('.fade').css 'opacity', (60 - scroll) / 60
    else
      $('header').toggleClass 'fixed', true

  # if (parseInt($(window).scrollTop(), 10) > distance)
  #   $('body').addClass(className)
  # else
  #   $('body').removeClass(className)

  $(".flexnav").flexNav();
  # $('header nav#main-nav').meanmenu()

  $(document).on 'page:fetch', ->
    $('#main .tile').reverse().each (index) ->
      $(this).delay(index * 200).fadeOut 'slow'

  $(document).on 'page:change', init

  init()
