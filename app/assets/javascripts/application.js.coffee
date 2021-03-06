#= require jquery
#= require jquery.turbolinks
#= require turbolinks
#= require jquery.flexslider
#= require TweenMax.min
#= require CSSPlugin.min
#= require swiffy
#= require header
#= require holder
#= require urlify
#= require jquery.fitvids
#= require clients
#= require logo
#= require videos
#= require about

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

  $(window).resize ->
    $('.work.c-videos #main-nav').css 'height', parseInt($('.subnav').css('height')) * 2
  .trigger 'resize'

  $('iframe#vimeo').hide()
  $('iframe#vimeo').load ->
    $(this).fadeIn()

  $('#vimeo-container').fitVids()

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
  opacity = if $('body').hasClass('c-clients') then 0.8 else 1
  $('#main .tile').each (index) ->
    TweenLite.to($(this), 1.8, {delay: 0.4 + index * 0.1, opacity: opacity})

jQuery ->


  # $(".fit-vids").fitVids({customSelector: 'video'})
  init()
  $('.flexslider').flexslider
    # animation: "slide"
    slideshowSpeed: 4000
    controlNav: false

$(document).on 'page:change', ->
  $('#homepage-video').load()
