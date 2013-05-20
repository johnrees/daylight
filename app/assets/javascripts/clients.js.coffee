jQuery ->

  $('.client').hover ->
    $('.client').removeClass('active')
    $(this).addClass('active')
    $('#client-name').text($(this).data('name'))
    $('#client-description').text($(this).data('description'))
