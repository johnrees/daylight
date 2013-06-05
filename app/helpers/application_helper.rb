module ApplicationHelper
  def vimeo_player src
    content_tag :iframe,
      nil,
      allowfullscreen: true,
      frameborder: 0,
      mozallowfullscreen: true,
      src: "http://player.vimeo.com/video/#{src}?color=F9A518",
      webkitallowfullscreen: true,
      width: 960,
      height: 540
  end

  def link_to_with_active_state text, link, html_options = {}
    link_to text, link, class: ('active' if request.path.include? link), data: { name: text.parameterize }
  end

end
