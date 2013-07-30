class StaticController < ApplicationController

  def home
    @video = HomepageVideo.first
    @videos = Video.featured.all
  end

  def about
  end

  def contact
  end

end
