module ApplicationHelper
  def vimeo_player src
    content_tag :iframe, nil, allowfullscreen: true, frameborder: 0, mozallowfullscreen: true, src: "http://player.vimeo.com/video/#{src}", webkitallowfullscreen: ""
  end

  def link_to_with_active_state text, link
    link_to text, link, class: ('active' if request.path.include? link)
  end

end
