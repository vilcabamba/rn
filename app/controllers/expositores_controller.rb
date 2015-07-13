class ExpositoresController < ApplicationController
  expose(:expositor)
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
end
