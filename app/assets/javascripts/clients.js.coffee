ready = ->

  $('.client').hover ->
    $('.client').removeClass('active')
    $(this).addClass('active')
    $('#client-info').html $(this).next('.client-description').html()
  .first().trigger 'mouseenter'

$(document).ready ready
$(document).on 'page:load', ready

