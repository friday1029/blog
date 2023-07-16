class Api::V1::EditorImageHelperController < ActionController::Base
  skip_before_action :verify_authenticity_token, only: :upload_image
  before_action :check_login
  def upload_image
    editor_image = EditorImage.new(image: params[:image])

    if editor_image.save
      render json: {
        image_url: editor_image.image.url, 
        stage: 'ok'
      }
    else
      render json: {
        stage: 'ng'
      }
    end
  end

  def check_login
    unless admin_signed_in?
      render json: { status: 'sign_in_first'}
      return
    end
  end
end
