module ApplicationHelper
  def vimeo_player src
    content_tag :iframe, nil, allowfullscreen: true, frameborder: 0, mozallowfullscreen: true, src: "http://player.vimeo.com/video/#{src}", webkitallowfullscreen: ""
  end
end
