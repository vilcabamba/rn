class InformatesController < ApplicationController
  add_breadcrumb t("views.home.index"), :root_path
  add_breadcrumb t("views.home.informate"), :informate_path
end
