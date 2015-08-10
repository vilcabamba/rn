class ApplicationController < ActionController::Base
  module Decoratable
    extend ActiveSupport::Concern

    module ClassMethods
      def decorate(name)
        expose(:"decorated_#{name}") {
          decorate send(name)
        }
      end
    end
  end
end
