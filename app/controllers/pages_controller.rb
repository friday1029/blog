class PagesController < ApplicationController
  def index
    @banners = Banner.all
    @posts = Post.published.default_order.first 3
    @works = Work.last 4
  end

  def about
    @about = PageBlock.find_or_create_by(meta_key: 'about')
  end

  def contact
    @contact_note = PageBlock.find_or_create_by(meta_key: 'contact_note')
    @contact = Contact.new
  end

  def contact_create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contact_path(@contact), notice: "聯絡訊息已送出"
    else
      flash[:alert] = "輸入資料有誤" 
      render :contact
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :content)
    end

end
