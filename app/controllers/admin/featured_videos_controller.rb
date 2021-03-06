class Admin::FeaturedVideosController < Admin::AdminController

  before_action :set_video, only: [:show, :edit, :update, :destroy]

  def sort
    if params[:video].present?
      Video.do_order(params[:video], nil, params[:tag_id].to_i)
    end
    render :text => params[:video].inspect
  end

  def index
    @videos = Video.includes(:tag).order('tag_ordinal ASC').group_by { |v| v.tag_id }
    # @videos[0] = @videos[nil]
  end

  def show
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)

    respond_to do |format|
      if @video.save
        format.html { redirect_to admin_videos_url, notice: 'Video was successfully created.' }
        format.json { render action: 'show', status: :created, location: @video }
      else
        format.html { render action: 'new' }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to admin_videos_url, notice: 'Video was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to admin_videos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:name, :slug, :vimeoid, :description, :tag_id, :feature, :image, :blurb)#, :tag_ids => [])
    end

end
