ready = ->

  $('header').css(opacity: 0).delay(300).animate({opacity: 1})

  height = $(window).innerHeight() + 150
  $('body').css('min-height', "#{height}px")
  # console.log height
  # $(window).on 'load', ->
  if $(window).width() > 480 and $('html').hasClass('no-touch')
    # unless $('body').hasClass('a-contact')
    $('body,html').scrollTop(85)#.c-videos, body.a-about, body.c-clients
  else
    $('body').scrollTop(0)

  $('.client.has-description').mouseover ->
    $(this).addClass('hovering')
  $('.client.has-description').mouseout ->
    $(this).removeClass('hovering')

  $('.client.has-description').on 'click touchend', ->
    $('.client').removeClass('active')
    $(this).addClass('active')
    #$('.details').hide()
    $(this).next('.details').css('background','red')
    $('.client-info').html $(this).next('.client-description').html()
  #.first().trigger 'mouseenter'

$(document).ready ready
# $(document).on 'page:load', ready

