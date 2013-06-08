ready = ->
  $('.client').hover ->
    $('.client').removeClass('active')
    $(this).addClass('active')
    $('#client-info').html $(this).next('.description').html()

$(document).ready ready
$(document).on 'page:load', ready

