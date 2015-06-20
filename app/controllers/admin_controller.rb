class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin!

  protected

  def require_admin!
    redirect_to(
      root_path,
      error: I18n.t("views.unauthorized")
    ) if !current_user.admin?
  end

  # for navbar
  def nav_item
    self.class.name
  end
end
