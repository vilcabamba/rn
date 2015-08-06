class ExpositoresController < ApplicationController
  expose(:expositor)
  expose(:expositores)
  expose(:tipos_personeria) {
    Expositor.tipo_personeria.keys
  }
  expose(:countries) {
    countries = ISO3166::Country.translations(I18n.locale)
    countries.inject({}) do |memo, (key, value)|
      memo[value] = key
      memo
    end
  }
  expose(:category_groups) {
    (1..2).map do |page|
      Category.order(:id).page(page).per(5)
    end
  }

  def index
    if params[:signed_in].present?
      flash[:alert] = t("devise.failure.already_authenticated")
    end
  end
end
