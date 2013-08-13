ready = ->

  $('header').css(opacity: 0).delay(300).animate({opacity: 1})
  if $('body.a-contact').length == 0
    $('body').scrollTop(140)
    $(window).on 'load', ->
      $('body').scrollTop(140)

  $('.client').click ->
    $('.client').removeClass('active')
    $(this).addClass('active')
    #$('.details').hide()
    $(this).next('.details').css('background','red')
    $('.client-info').html $(this).next('.client-description').html()
  #.first().trigger 'mouseenter'

$(document).ready ready
$(document).on 'page:load', ready

