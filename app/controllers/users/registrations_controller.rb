module Users
  class RegistrationsController < Devise::RegistrationsController
    before_filter :update_sanitized_params, if: :devise_controller?

    private

    def update_sanitized_params
      devise_parameter_sanitizer.for(:sign_up) do |u|
        u.permit(
          :name,
          :email,
          :password,
          :password_confirmation,
          expositor_attributes: [
            :company,
            :name,
            :address,
            :country,
            :phone,
            :web_site,
            :alcance,
            :photo,
            :photo_cache,
            :details,
            :interest,
            :category_id
          ]
        )
      end
    end
  end
end
