class Admins::WorksController < AdminController
  before_action :set_work, only: %i[ show edit update destroy ]

  # GET /admins/works or /admins/works.json
  def index
    @works = Work.order :id
  end

  # GET /admins/works/1 or /admins/works/1.json
  def show
  end

  # GET /admins/works/new
  def new
    @work = Work.new
  end

  # GET /admins/works/1/edit
  def edit
  end

  # POST /admins/works or /admins/works.json
  def create
    @work = Work.new(work_params)

    respond_to do |format|
      if @work.save
        format.html { redirect_to admins_work_path(@work), notice: "Work was successfully created." }
        format.json { render :show, status: :created, location: @work }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/works/1 or /admins/works/1.json
  def update
    respond_to do |format|
      if @work.update(work_params)
        format.html { redirect_to admins_work_path(@work), notice: "Work was successfully updated." }
        format.json { render :show, status: :ok, location: @work }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/works/1 or /admins/works/1.json
  def destroy
    @work.destroy

    respond_to do |format|
      format.html { redirect_to admins_works_url, notice: "Work was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work
      @work = Work.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def work_params
      params.require(:work).permit(:name_zh, :name_en, :site_url, :desc_zh, :desc_en, :logo, :intro_zh, :intro_en,
        site_screenshots_attributes: [:id, :image, :_destroy], 
      )
    end
end
