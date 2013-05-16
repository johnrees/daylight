jQuery ->
  $('.video').mouseenter ->
    TweenMax.to( $(this).find('.bg'), 0.1, { opacity: 1 })
  $('.video').mouseleave ->
    TweenMax.to( $(this).find('.bg'), 0.8, { opacity: 0 })