class User < ActiveRecord::Base
  module Authenticatable
    extend ActiveSupport::Concern

    module ClassMethods
      def from_omniauth(auth)
        where(
          provider: auth.provider,
          uid: auth.uid
        ).first_or_initialize.tap do |user|
          user.email = auth.info.email if auth.info.email.present?
          user.password = Devise.friendly_token[0,20] if user.password.blank?

          expositor = user.expositor || user.build_expositor
          expositor.name = auth.info.name
          expositor.remote_photo_url = auth.info.image
          expositor.address = auth.info.location
          expositor.web_site = auth.info.urls["Website"]

          if user.valid? && expositor.valid?
            user.save && expositor.save
          end
        end
      end
    end
  end
end
