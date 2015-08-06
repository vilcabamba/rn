class ApplicationController < ActionController::Base
  module DeviseExtendable
    extend ActiveSupport::Concern

    included do
      after_filter :store_location!
    end

    def after_sign_in_path_for(resource)
      stored_location_for(:user) || root_path
    end

    def store_location!
      store_location_for(
        :user,
        request.fullpath
      ) if request.get?
    end
  end
end
