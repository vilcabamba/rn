class ApplicationController < ActionController::Base
  include DeviseExtendable
  include ExternalFonts

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  add_flash_types :error

  # strong_params in decent exposure
  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  expose(:decorated_current_user) {
    decorate current_user
  }

  expose(:countries_for_select) {
    countries = ISO3166::Country.translations(I18n.locale)
    countries.inject({}) do |memo, (key, value)|
      memo[value] = key
      memo
    end
  }

  expose(:categories_for_select) {
    Category.all.map do |category|
      [category.name, category.id]
    end
  }

  protected

  def t(*args)
    self.class.t(*args)
  end

  def self.t(*args)
    I18n.t(*args)
  end
end
