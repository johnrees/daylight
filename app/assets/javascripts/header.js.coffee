$('header .fade, #main .fade').css('opacity', 0)

headerStuff = (event = null) ->

  if $('html').hasClass('no-touch')
    fadeDistance  = 85
    className   = 'scrolled'
    headerheight = 320

    if $(window).width() > 480

      scroll = parseInt Math.max(0,$(window).scrollTop())
      # console.log scroll
      # console.log $('header').height(), scroll
      TweenLite.to $('#aperture'), 0.1, { rotation: Math.min($(window).scrollTop() * 4.24, 360) }
      $('#head').css 'height', (headerheight - scroll)
      $('.fade').css 'opacity', Math.max(0, (fadeDistance - scroll) / fadeDistance)

      $('header').toggleClass 'fixed', ($('header').height() <= 235)

jQuery ->
  $(document).on 'scroll', headerStuff
  $(window).on 'resize', headerStuff
