class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActiveRecord::RecordInvalid,  with: :render_
  rescue_from ActionController::InvalidAuthenticityToken,  with: :render_404
  rescue_from NoMethodError,  with: :render_404
  rescue_from ActionView::Template::Error,  with: :render_404

  def render_404
    #flash[:warning] = 'ActiveRecord::RecordNotFound'
    request.format = :html
    respond_to do |format|
      format.html { render 'pages/render_404', status: 404 }
      format.json { render json: {:error => "not found"}.to_json, :status => 404 }
    end
  end  
end
