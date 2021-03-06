class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin!

  layout "admin"

  protected

  def require_admin!
    redirect_to(
      root_path,
      error: t("views.unauthorized")
    ) if !current_user.admin?
  end

  # for navbar
  def nav_item
    self.class.name
  end
end
