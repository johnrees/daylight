$('.fade').css('opacity', 0)

headerStuff = (event = null) ->

  if $('html').hasClass('no-touch')
    fadeDistance    = 80
    className   = 'scrolled'
    headerheight = 320

    if $(window).width() > 480

      scroll = parseInt Math.max(0,$(window).scrollTop())
      # console.log $('header').height(), scroll
      TweenLite.to $('#aperture'), 0.1, { rotation: Math.min($(window).scrollTop() * 2.11, 360) }
      $('#head').css 'height', (headerheight - scroll)
      $('.fade').css 'opacity', (fadeDistance - scroll) / fadeDistance

      $('header').toggleClass 'fixed', ($('header').height() <= 185)

jQuery ->
  $(document).on 'scroll', headerStuff
  $(window).on 'resize', headerStuff
