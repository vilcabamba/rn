class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    self.resource = User.from_omniauth(request.env["omniauth.auth"])

    if resource.persisted?
      sign_in_and_redirect resource, event: :authentication
      set_flash_message(:notice, :success, kind: :twitter) if is_navigational_format?
    else
      resource.errors.clear
      flash[:notice] = t("views.registrations.complete_profile")
      render "devise/registrations/new"
    end
  end
end
