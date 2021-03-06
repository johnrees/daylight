window.array = []

pad = (n, width, z) ->
  z = z or "0"
  n = n + ""
  (if n.length >= width then n else new Array(width - n.length + 1).join(z) + n)

jQuery ->
  count = 1

  $(window).resize ->
    window.array = []
    height = $('body').height() - $(window).innerHeight()
    size = height / 23
    window.array.unshift Math.floor(height)  while (height -= size) >= 0
    # $(".scrubsprite").each ->
    #   $(this).data "startscroll", $(this).offset.top
  .trigger 'resize'

  if $('html').hasClass('no-touch') and $('body').hasClass('a-about')
    $(window).on 'scroll touchmove', ->
      # gesturechange
      scroll = $(document).scrollTop()

      i = 1
      while i < 22
        break if (scroll < window.array[i])
        i++

      $(".scrubsprite").removeClass().addClass("scrubsprite s-" + pad(i + 1, 2))

