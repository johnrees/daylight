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
    size = height / 22
    window.array.unshift height  while (height -= size) >= 0
    # $(".scrubsprite").each ->
    #   $(this).data "startscroll", $(this).offset.top
  .trigger 'resize'

  $(window).scroll ->
    scroll = $("body").scrollTop()
    return false  if scroll % 2 is 0
    i = 0
    while i < 22
      break if scroll < window.array[i]
      $(".scrubsprite").removeClass().addClass("scrubsprite s-" + pad(i + 1, 2))
      i++
