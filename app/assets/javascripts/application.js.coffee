#= require jquery
#= require aaheader
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

# nooo #= require turbolinks

jQuery.fn.reverse = [].reverse

createMap = ->
  map = L.map('map', { zoomControl: false }).setView([55.43119, -2.60000], 12);

  L.tileLayer('http://{s}.tile.cloudmade.com/BC9A493B41014CAABB98F0471D759707/997/256/{z}/{x}/{y}.png', {
    maxZoom: 20
  }).addTo(map)

  L.marker([55.43119, -2.60000]).addTo(map)
  new L.Control.Zoom({ position: 'topright' }).addTo(map)

init = ->

  $('#nav-button').click ->
    $('#main-nav').toggle()

  $('#homepage-video').mediaelementplayer
    loop: true
    defaultVideoWidth: "100%"
    defaultVideoHeight: 600
    videoWidth: -1
    videoHeight: -1


  $('#main-nav').css 'height', parseInt($('#main-nav').css('height')) * 2
  $('iframe#vimeo').hide()
  $('iframe#vimeo').load ->
    $(this).fadeIn()


  $('#vimeo-container').fitVids()

  # $('#main .tile').opacity(0)
  $('#main .tile').each ->
    TweenLite.to($(this), 0, {opacity: 0})

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
    TweenLite.to($(this), 2, {delay: 0.3 + index * 0.2, opacity: 1})
    #$(this).animate()#delay(index * 200).fadeIn 'slow'

jQuery ->



  $(".flexnav").flexNav();
  # $('header nav#main-nav').meanmenu()

  $(document).on 'page:fetch', ->
    $('#main .tile').reverse().each (index) ->
      $(this).delay(index * 200).fadeOut 'slow'

  $(document).on 'page:change', init
  $(document).on 'page:load', ->
    $(window).scrollTop(0,100)

  init()

