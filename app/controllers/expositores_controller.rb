class ExpositoresController < ApplicationController
  add_breadcrumb t("views.home.index"), :root_path
  add_breadcrumb t("views.home.expositores"), :expositores_path

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
  expose(:decorated_expositor) {
    decorate expositor
  }

  def index
    add_breadcrumb t("views.home.expositores"), :expositores_path
    if params[:signed_in].present?
      flash.now[:alert] = t("devise.failure.already_authenticated")
    end
  end

  def show
    add_breadcrumb expositor.category.name
    add_breadcrumb expositor.company
  end
end
