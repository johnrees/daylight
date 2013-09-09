ready = ->

  $('header').css(opacity: 0).delay(300).animate({opacity: 1})


  $(window).on 'load', ->
    if $(window).width() > 480
      $('body.c-videos').scrollTop(140)
    else
      $('body').scrollTop(0)

  $('.client.has-description').mouseover ->
    $(this).addClass('hovering')
  $('.client.has-description').mouseout ->
    $(this).removeClass('hovering')

  $('.client.has-description').click ->
    $('.client').removeClass('active')
    $(this).addClass('active')
    #$('.details').hide()
    $(this).next('.details').css('background','red')
    $('.client-info').html $(this).next('.client-description').html()
  #.first().trigger 'mouseenter'

$(document).ready ready
$(document).on 'page:load', ready

