class Admin::HomepageVideosController < Admin::AdminController

  before_action :homepage_set_video, only: [:show, :edit, :update, :destroy]

  def sort
    if params[:homepage_video].present?
      HomepageVideo.do_order(params[:homepage_video])
    end
    render :text => params[:homepage_video].inspect
  end

  def index
    @homepage_videos = HomepageVideo.order('ordinal ASC')
  end

  def show
  end

  # GET /homepage_videos/new
  def new
    @homepage_video = HomepageVideo.new
  end

  # GET /homepage_videos/1/edit
  def edit
  end

  # POST /homepage_videos
  # POST /homepage_videos.json
  def create
    @homepage_video = HomepageVideo.new(homepage_video_params)

    respond_to do |format|
      if @homepage_video.save
        format.html { redirect_to admin_homepage_videos_url, notice: 'HomepageVideo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @homepage_video }
      else
        format.html { render action: 'new' }
        format.json { render json: @homepage_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homepage_videos/1
  # PATCH/PUT /homepage_videos/1.json
  def update
    respond_to do |format|
      if @homepage_video.update(homepage_video_params)
        format.html { redirect_to admin_homepage_videos_url, notice: 'HomepageVideo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @homepage_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homepage_videos/1
  # DELETE /homepage_videos/1.json
  def destroy
    @homepage_video.destroy
    respond_to do |format|
      format.html { redirect_to admin_homepage_videos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def homepage_set_video
      @homepage_video = HomepageVideo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def homepage_video_params
      params.require(:homepage_video).permit(:video, :ordinal, :name)
    end

end
