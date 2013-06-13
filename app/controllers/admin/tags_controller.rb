class Admin::TagsController < Admin::AdminController

  def sort
    if params[:tag].present?
      Tag.do_order(params[:tag])
    end
    render :text => params[:tag].inspect
  end

  def update
    @tag = Tag.find(params[:id])
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to admin_videos_url, notice: 'Tag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:name)
    end

end
