#= require jquery
#= require turbolinks
#= require holder
#= require urlify
#= require jquery.isotope
#= require jquery.flexnav
#= require jquery.fitvids
#= require jquery.ba-throttle-debounce.js
#= require clients
#= require logo
#= require static
#= require videos

init = ->
  $('#main-nav').css 'height', parseInt($('#main-nav').css('height')) * 2
  $('iframe#vimeo').css 'visibility', 'hidden'
  $('iframe#vimeo').load -> $(this).fadeIn()

  $('#vimeo-container').fitVids()

  $('#main .tile').hide()
  loaded()

loaded = ->
  $('#main .tile').each (index) ->
    $(this).delay(index * 200).fadeIn 'slow'

scroll = ->

jQuery.fn.reverse = [].reverse

jQuery ->

  fadeDistance    = 30
  className   = 'scrolled'

  headerheight = $('header').height()

  # $.throttle( 50,
  $(document).on 'scroll', (event) ->
    if $(window).width() > 480
      scroll = parseInt $(window).scrollTop()
      if scroll <= 100
        $('header').toggleClass 'fixed', false
        $('#head').css 'height', Math.max(100, headerheight - scroll)
        $('.fade').css 'opacity', (fadeDistance - scroll) / fadeDistance
      else
        $('header').toggleClass 'fixed', true


  $(".flexnav").flexNav();
  # $('header nav#main-nav').meanmenu()

  $(document).on 'page:fetch', ->
    $('#main .tile').reverse().each (index) ->
      $(this).delay(index * 200).fadeOut 'slow'

  $(document).on 'page:change', init

  init()
