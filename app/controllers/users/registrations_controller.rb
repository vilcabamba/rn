module Users
  class RegistrationsController < Devise::RegistrationsController
    before_filter :update_sanitized_params, if: :devise_controller?

    expose(:countries) {
      countries = ISO3166::Country.translations(I18n.locale)
      countries.inject({}) do |memo, (key, value)|
        memo[value] = key
        memo
      end
    }

    expose(:categories) {
      Category.all.map do |category|
        [category.name, category.id]
      end
    }

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
            :details,
            :interest,
            :category_id
          ]
        )
      end
    end

    def expositor_attributes
      params.require(:user)
            .permit(expositor_attributes: [
              :country
            ])
    end
  end
end
