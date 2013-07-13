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

jQuery.fn.reverse = [].reverse

init = ->
  $('#main-nav').css 'height', parseInt($('#main-nav').css('height')) * 2
  $('iframe#vimeo').hide()
  $('iframe#vimeo').load -> $(this).fadeIn()

  $('#vimeo-container').fitVids()

  $('#main .tile').hide()

  if $('#homepage-video video').length > 0
    $('#homepage-video video').get(0).play()

  $('#nav-button').on 'click', (event) ->
    # $('#responsive-nav').append $('nav#main-nav')
    event.preventDefault()
    $('#responsive-nav').css('max-height', '500px')
  loaded()

loaded = ->
  $('#main .tile').each (index) ->
    $(this).delay(index * 200).fadeIn 'slow'

jQuery ->


  fadeDistance    = 30
  className   = 'scrolled'

  headerheight = $('header').height()

  # $.throttle( 50,
  $(document).on 'scroll', (event) ->

    if $(window).width() > 480
      scroll = parseInt Math.max(0,$(window).scrollTop())
      if scroll <= 100

        TweenLite.to $('#aperture'), 0.1, { rotation: $(window).scrollTop() * 3.6 }

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
