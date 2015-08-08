class MeController < ApplicationController
  before_action :authenticate_user!

  add_breadcrumb t("views.home.index"), :root_path
  add_breadcrumb t("views.home.expositores"), :expositores_path

  expose(:expositor) {
    current_user.expositor
  }

  def show
    add_breadcrumb expositor.category.name
    add_breadcrumb expositor.company, expositor_path(expositor)
    add_breadcrumb t("views.current_user.edit_profile"), :me_path
  end

  def update
    if expositor.update(expositor_params)
      flash[:notice] = t("views.me.updated")
      redirect_to expositor_path(expositor)
    else
      flash[:error] = t("views.me.not_updated")
      render :show
    end
  end

  private

  def expositor_params
    params.require(:expositor)
          .permit :company,
                  :name,
                  :address,
                  :country,
                  :phone,
                  :web_site,
                  :category_id,
                  :alcance,
                  :details,
                  :interest,
                  :photo,
                  :photo_cache,
                  :facebook,
                  :twitter,
                  :skype,
                  :instagram
  end
end
