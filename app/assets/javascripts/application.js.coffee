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
#= require mediaelement-and-player

jQuery.fn.reverse = [].reverse

createMap = ->
  map = L.map('map', { zoomControl: false }).setView([55.43119, -2.60000], 12);

  L.tileLayer('http://{s}.tile.cloudmade.com/BC9A493B41014CAABB98F0471D759707/997/256/{z}/{x}/{y}.png', {
    maxZoom: 20
  }).addTo(map)

  L.marker([55.43119, -2.60000]).addTo(map)
  new L.Control.Zoom({ position: 'topright' }).addTo(map)

init = ->

  $('#homepage-video').mediaelementplayer
    loop: true
    defaultVideoWidth: "100%"
    defaultVideoHeight: 300


  $('#main-nav').css 'height', parseInt($('#main-nav').css('height')) * 2
  $('iframe#vimeo').hide()
  $('iframe#vimeo').load ->
    $(this).fadeIn()


  $('#vimeo-container').fitVids()

  $('#main .tile').hide()

  if $('#homepage-video video').length > 0
    $('#homepage-video video').get(0).play()

  $('#nav-button').on 'click', (event) ->
    # $('#responsive-nav').append $('nav#main-nav')
    event.preventDefault()
    $('#responsive-nav').css('max-height', '500px')
  loaded()

  createMap() if $('#map').length > 0



loaded = ->
  $('#main .tile').each (index) ->
    $(this).delay(index * 200).fadeIn 'slow'

jQuery ->

  #window.scrollTo 0, 100
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
  $(document).on 'page:load', ->
    $(window).scrollTop(0,100)

  init()

