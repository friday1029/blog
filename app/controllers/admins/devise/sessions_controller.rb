# devise 的 controller 會先繼承 application controller,
# debug 也要看一下 application controller
class Admins::Devise::SessionsController < Devise::SessionsController
  # skip_before_action :verify_authenticity_token, only: :new
  # before_action :configure_sign_in_params, only: [:create]
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

end
