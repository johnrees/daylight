class StaticController < ApplicationController

  def home
    @video = HomepageVideo.active.first(order: "RANDOM()")
    @videos = Video.featured.all
  end

  def about
  end

  def contact
  end

end
