module API::V1::Auth
  class PasswordsController < DeviseTokenAuth::PasswordsController
    def edit
      super
    rescue ActionController::RoutingError
      render_error(404, I18n.t('errors.password.invalid_or_expired_token'))
    end
  end
end
