class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  include ApplicationHelper

  %w(work light_work).each do |method|
    define_method(method) do
      view_context.title(method)
      @tags = Tag.where('category = ?', method).order('ordinal ASC')
      if params[:tag].present?
        tag = Tag.where('category = ? and slug = ?', method, params[:tag]).first
        @videos = tag.videos.order('tag_ordinal asc')
      else
        @videos = Video.joins(:tag).where('tags.category = ?', method).order('ordinal asc')
      end
      render :index
    end
  end

  def show
    @video = Video.friendly.find(params[:id])
    @previous_video = Video.tagged.where("videos.id > ?", @video.id).order("id ASC").first
    @next_video = Video.tagged.where("videos.id < ?", @video.id).order("id DESC").first
    # @videos = Video.joins(:tag).where('tag_id > 0').limit(3)
  end

  def featured
    @id = (params[:id] || 1).to_i
    @video = Video.featured.all[@id - 1]#.video
    @videos = Video.featured.all
    # render :show
  end

  def showreel
    @video = Video.where("name = ?", 'showreel').first
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      begin
        @video = Video.friendly.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        return redirect_to work_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:name, :slug, :vimeoid, :description, :tag_id, :tag, :blurb)
    end

end
