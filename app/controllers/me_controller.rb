class MeController < ApplicationController
  before_action :authenticate_user!

  expose(:expositor) {
    current_user.expositor
  }

  def update
    if expositor.update(expositor_params)
      flash[:notice] = t("views.me.updated")
      redirect_to action: :show
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
                  :facebook,
                  :twitter,
                  :skype,
                  :instagram
  end
end
