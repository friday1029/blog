class Admins::PostsController < AdminController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /admins/posts or /admins/posts.json
  def index
    @posts = Post.all
  end

  # GET /admins/posts/1 or /admins/posts/1.json
  def show
  end

  # GET /admins/posts/new
  def new
    @post = Post.new
  end

  # GET /admins/posts/1/edit
  def edit
  end

  # POST /admins/posts or /admins/posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to admins_post_path(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/posts/1 or /admins/posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to admins_post_path(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/posts/1 or /admins/posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to admins_posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title_zh, :title_en, :content_zh, :content_en)
    end
end
