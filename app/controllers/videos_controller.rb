class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  def light_work
    @videos = Video.all
    @categories = %w(TV Business Public_Sector Education Music/Fashion)
    render :index
  end

  def work
    @videos = Video.all
    @categories = %w(TV Business Public_Sector Education Music/Fashion)
    render :index
  end

  def featured
  end

  def showreel
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:name, :slug, :vimeoid, :description)
    end

end
