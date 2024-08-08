# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :basic_auth, unless: :skip_basic_auth?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end

  def skip_basic_auth?
    Rails.env.test?
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_date])
  end
end
