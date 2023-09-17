class Admins::PageBlocksController < AdminController
  before_action :set_page_block, only: %i[ show edit update destroy ]

  # GET /page_blocks or /page_blocks.json
  def index
    if allow_meta_key.include?(params[:meta_key])
      @page_block = PageBlock.find_or_create_by(meta_key: params[:meta_key])
      render :show
    else
      @page_blocks = PageBlock.all
    end
  end

  # GET /page_blocks/1 or /page_blocks/1.json
  def show
  end

  # GET /page_blocks/new
  def new
    @page_block = PageBlock.new
  end

  # GET /page_blocks/1/edit
  def edit
  end

  # POST /page_blocks or /page_blocks.json
  def create
    @page_block = PageBlock.new(page_block_params)

    respond_to do |format|
      if @page_block.save
        format.html { redirect_to admins_page_block_url(@page_block), notice: "Page block was successfully created." }
        format.json { render :show, status: :created, location: @page_block }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @page_block.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /page_blocks/1 or /page_blocks/1.json
  def update
    respond_to do |format|
      if @page_block.update(page_block_params)
        format.html { redirect_to admins_page_block_url(@page_block), notice: "Page block was successfully updated." }
        format.json { render :show, status: :ok, location: @page_block }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @page_block.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /page_blocks/1 or /page_blocks/1.json
  def destroy
    @page_block.destroy

    respond_to do |format|
      format.html { redirect_to admins_page_blocks_url, notice: "Page block was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def allow_meta_key
      %W(about contact_note)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_page_block
      @page_block = PageBlock.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def page_block_params
      params.require(:page_block).permit(:meta_key, :content_zh, :content_en, :note)
    end
end
