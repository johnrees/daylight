$('.fade').css('opacity', 0)

headerStuff = (event) ->

  fadeDistance    = 80
  className   = 'scrolled'
  headerheight = 320

  if $(window).width() > 480
    scroll = parseInt Math.max(0,$(window).scrollTop())
    console.log scroll

    TweenLite.to $('#aperture'), 0.1, { rotation: Math.min($(window).scrollTop() * 2.11, 360) }
    $('#head').css 'height', (headerheight - scroll)
    $('.fade').css 'opacity', (fadeDistance - scroll) / fadeDistance

    $('header').toggleClass 'fixed', (scroll > 145)

jQuery ->
  $(document).on 'scroll', headerStuff
  $(window).on 'resize', headerStuff
