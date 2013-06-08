ready = ->

  $('.video').mouseenter ->
    # TweenMax.to( $(this), 0.1, { backgroundSize: '400px 400px' })
    TweenMax.to( $(this).find('.bg'), 0.1, { opacity: 1 })
  $('.video').mouseleave ->
    # TweenMax.to( $(this), 1, { backgroundSize: '400px 400px' })
    TweenMax.to( $(this).find('.bg'), 0.8, { opacity: 0 })
  $('.video').hide()

  $('nav li a').mouseenter ->
    TweenMax.to( $(this), 0.1, { backgroundColor: $(this).parents('nav').data('bgcolor') })
  $('nav li a').mouseleave ->
    unless $(this).hasClass('active')
      TweenMax.to( $(this), 0.8, { backgroundColor: '#FFF' })

  counter = 100
  $('.video').each ->
    $(this).delay(counter).fadeIn()
    counter += 30

  $('#video_vimeoid').change ->
    $(this).val $(this).val().match(/(\d{3,10})/)[0]
    url = "http://vimeo.com/api/v2/video/#{$(this).val()}.json?callback=?"
    $.getJSON url, (data) ->
      if data[0]
        $('#video_name').val( data[0].title )
        $('#video_description').val( data[0].description.replace(/(<([^>]+)>)/ig,"") )

  $('body.c-videos #videos').isotope
    itemSelector : '.video'
    layoutMode : 'fitRows'

  $('.c-videos.a-index #sub-nav li:eq(2)').after $('li.all')
  $('.c-videos.a-light_work #sub-nav').append $('li.all')

  $('#sub-nav a').click (e) ->
    e.preventDefault()
    $('#sub-nav a').removeClass('active').css('background', 'none')
    $(this).addClass('active').trigger('mouseenter')
    filter =  if $(this).data('name') is "all" then "*" else ".#{$(this).data('name')}"
    $('.c-videos #videos').isotope
      filter: filter


$(document).ready ready
$(document).on 'page:load', ready