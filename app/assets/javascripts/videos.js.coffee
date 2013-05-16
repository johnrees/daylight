jQuery ->
  $('.video').mouseenter ->
    # TweenMax.to( $(this), 0.1, { backgroundSize: '400px 400px' })
    TweenMax.to( $(this).find('.bg'), 0.1, { opacity: 1 })
  $('.video').mouseleave ->
    # TweenMax.to( $(this), 1, { backgroundSize: '400px 400px' })
    TweenMax.to( $(this).find('.bg'), 0.8, { opacity: 0 })
  $('.video').hide()

  counter = 100
  $('.video').each ->
    $(this).delay(counter).fadeIn()
    counter += 30