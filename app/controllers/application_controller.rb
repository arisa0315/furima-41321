class ApplicationController < ActionController::Base
  before_action :basic_auth, unless: :skip_basic_auth?
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_url_options_for_active_storage

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end

  def skip_basic_auth?
    Rails.env.test?
  end

  def set_url_options_for_active_storage
    ActiveStorage::Current.url_options = { protocol: request.protocol, host: request.host_with_port }
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_date])
  end
end
