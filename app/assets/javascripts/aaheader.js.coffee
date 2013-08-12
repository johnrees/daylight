# $('#head').css('opacity', 0).delay(300).animate({opacity: 1}, 100)

$('.fade').css('opacity', 0)
#window.scrollTo 0, 100
fadeDistance    = 80
className   = 'scrolled'

headerheight = 320#$('header').height()
# $('#head').css 'height', 180
# $('.fade').css 'opacity', 0

# $.throttle( 50,
$(window).on 'scroll', (event) ->
  console.log 'scroll'
  if $(window).width() > 480
    scroll = parseInt Math.max(0,$(window).scrollTop())
    if scroll <= 140

      TweenLite.to $('#aperture'), 0.1, { rotation: $(window).scrollTop() * 3.6 }

      $('header').toggleClass 'fixed', false
      $('#head').css 'height', Math.max(180, headerheight - scroll)
      $('.fade').css 'opacity', (fadeDistance - scroll) / fadeDistance
    else
      $('header').toggleClass 'fixed', true