class Admins::BannersController < AdminController
  before_action :set_banner, only: %i[ show edit update destroy ]

  # GET /admins/banners or /admins/banners.json
  def index
    @banners = Banner.all
  end

  # GET /admins/banners/1 or /admins/banners/1.json
  def show
  end

  # GET /admins/banners/new
  def new
    @banner = Banner.new
  end

  # GET /admins/banners/1/edit
  def edit
  end

  # POST /admins/banners or /admins/banners.json
  def create
    @banner = Banner.new(banner_params)

    respond_to do |format|
      if @banner.save
        format.html { redirect_to admins_banner_url(@banner), notice: "Banner was successfully created." }
        format.json { render :show, status: :created, location: @banner }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @banner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/banners/1 or /admins/banners/1.json
  def update
    respond_to do |format|
      if @banner.update(banner_params)
        format.html { redirect_to admins_banner_url(@banner), notice: "Banner was successfully updated." }
        format.json { render :show, status: :ok, location: @banner }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @banner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/banners/1 or /admins/banners/1.json
  def destroy
    @banner.destroy

    respond_to do |format|
      format.html { redirect_to admins_banners_url, notice: "Banner was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_banner
      @banner = Banner.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def banner_params
      params.require(:banner).permit(:title_zh, :title_en, :subtitle_zh, :subtitle_en, :image)
    end
end
