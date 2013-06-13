ready = ->

  $('body.c-videos.a-work a[data-name="work"]').addClass('active')
  $('body.c-videos.a-light_work a[data-name="light-work"]').addClass('active')

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

  # counter = 100
  # $('.video').each ->
  #   $(this).delay(counter).fadeIn()
  #   counter += 30



  # $('body.c-videos #videos').isotope( 'destroy' ).isotope
  #   itemSelector : '.video'
  #   layoutMode : 'fitRows'

  $('.c-videos.a-work #sub-nav li:eq(2)').after $('li.all')
  $('.c-videos.a-light_work #sub-nav').append $('li.all')

  # $('#sub-nav a').click (e) ->
  #   e.preventDefault()
  #   $('#sub-nav a').removeClass('active').css('background', 'none')
  #   $(this).addClass('active').trigger('mouseenter')
  #   filter =  if $(this).data('name') is "all" then "*" else ".#{$(this).data('name')}"

  # filter = window.location.toString().split('/')[4]
  # filter = if filter then ".#{filter}" else "*"
  # console.log filter
  # $('.c-videos #videos').isotope
  #   filter: filter


$(document).ready ready
$(document).on 'page:load', ready