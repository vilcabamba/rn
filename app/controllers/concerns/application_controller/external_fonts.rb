class ApplicationController < ActionController::Base
  module ExternalFonts
    extend ActiveSupport::Concern

    def external_fonts_url
      @external_fonts_url ||= "http://fonts.googleapis.com/css?family=#{font_families}"
    end

    def font_families
      fonts = {
        Raleway: %w(600),
        Montserrat: %w(700)
      }
      fonts.map do |name, weights|
        "#{name}:#{weights.join(",")}"
      end.join("|")
    end

    included do
      helper_method :external_fonts_url
    end
  end
end
