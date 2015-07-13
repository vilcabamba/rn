class ReservasController < ApplicationController
  expose(:new_user) { User.new }
  expose(:devise_mapping) { Devise.mappings[:user] }

  before_action :ask_info_if_logged_in, only: :new

  private

  def ask_info_if_logged_in
    if current_user
      redirect_to new_expositores_path
    end
  end
end
