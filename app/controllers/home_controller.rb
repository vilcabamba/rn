class HomeController < ApplicationController
  expose(:actions) {
    %w(
      informate
      inscribete
      expositores
    )
  }
end
