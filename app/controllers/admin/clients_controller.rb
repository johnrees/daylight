require 'ostruct'

class Admin::ClientsController < Admin::AdminController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def sort
    # order =
    Client.do_order(params[:client])
    render :text => params[:client].inspect
  end

  # GET /clients
  # GET /clients.json
  def index

    @clients = Client.order('ordinal ASC')
    # @clients = []
    # %w(asda bt sony jvc bbc o2 sainsburys bp m_and_s tk_maxx lilly sky).each do |client|
    #   @clients.push OpenStruct.new(name: client.humanize.capitalize, description: Faker::Lorem.paragraphs.join(''), slug: client)
    # end
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to admin_clients_url, notice: 'Client was successfully created.' }
        format.json { render action: 'show', status: :created, location: @client }
      else
        format.html { render action: 'new' }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to admin_clients_url, notice: 'Client was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to admin_clients_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:ordinal, :name, :slug, :description, :logo)
    end
end