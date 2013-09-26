ready = ->

  $('body.work a[data-name="work"]').addClass('active')
  $('body.light-work a[data-name="light-work"]').addClass('active')

  $('.video').mouseenter ->
    # $(this).addClass('active')
    # TweenMax.to( $(this), 0.1, { backgroundSize: '400px 400px' })
    TweenMax.to( $(this).find('.bg'), 0.1, { opacity: 1 })
  $('.video').mouseleave ->
    # $(this).removeClass('active')
    # TweenMax.to( $(this), 1, { backgroundSize: '400px 400px' })
    TweenMax.to( $(this).find('.bg'), 2, { opacity: 0 })
  # $('.video').hide()

  $('nav#main-nav a.active').css 'background-color', $('nav#main-nav a.active').parents('li').last().data('bg')
  $('nav li a').mouseenter ->
    TweenMax.to( $(this), 0.1, { backgroundColor: $(this).parents('li').data('bg') })
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

  $('body.work #work-subnav li:eq(2)').after $('body.work #work-subnav li.all')
  $('body.light-work #light-work-subnav').append $('body.light-work #light-work-subnav li.all')

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