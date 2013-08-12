ready = ->

  $(window).on 'load', ->
    $('body').scrollTop(150)

  $('.client').hover ->
    $('.client').removeClass('active')
    $(this).addClass('active')
    #$('.details').hide()
    $(this).next('.details').css('background','red')
    $('.client-info').html $(this).next('.client-description').html()
  #.first().trigger 'mouseenter'

$(document).ready ready
$(document).on 'page:load', ready

