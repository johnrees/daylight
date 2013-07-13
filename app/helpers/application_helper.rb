module ApplicationHelper
  def vimeo_player src
    content_tag :div, id: 'vimeo-container' do
    content_tag :iframe,
      nil,
      allowfullscreen: true,
      frameborder: 0,
      mozallowfullscreen: true,
      src: "http://player.vimeo.com/video/#{src}?color=F9A518",
      webkitallowfullscreen: true,
      id: 'vimeo',
      width: 990,
      height: 557
  end
  end

    def title(page_title)
    content_for :title, page_title.to_s
  end

  def link_to_with_active_state text, link, html_options = {}
    link_to text, link, class: ('active' if request.path == link), data: { name: text.parameterize }
    #  or request.path == data[:active]
  end

end
