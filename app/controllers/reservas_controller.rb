class ReservasController < ApplicationController
  expose(:new_user) { User.new }
  expose(:devise_mapping) { Devise.mappings[:user] }
end
