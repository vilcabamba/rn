module Admin
  class ButacasController < ::AdminController
    include Breadcrumbs

    resource :butaca, ancestor: :escenario

    before_action :ancestor_breadcrumbs
    before_action :add_breadcrumbs

    expose :butacas, ancestor: :escenario
    expose :butaca, attributes: :butaca_params
    expose(:escenario) {
      Escenario.find params[:escenario_id]
    }

    def create
      if butaca.save
        redirect_to admin_escenario_butacas_path,
                    notice: t("views.butacas.created")
      else
        render :new
      end
    end

    def update
      if butaca.save
        redirect_to admin_escenario_butacas_path,
                    notice: t("views.butacas.updated")
      else
        render :edit
      end
    end

    def destroy
      if butaca.destroyable?
        butaca.destroy
        redirect_to admin_escenario_butacas_path,
                    notice: t("views.butacas.deleted")
      else
        redirect_to admin_escenario_butacas_path,
                    error: t("views.butacas.cant_delete")
      end
    end

    private

    def nav_item
      "escenarios"
    end

    def ancestor_breadcrumbs
      add_breadcrumb(
        t("activerecord.models.escenario").pluralize,
        admin_escenarios_path
      )
      add_breadcrumb(
        escenario,
        admin_escenario_butacas_path
      )
    end

    def breadcrumb_for_show
      add_breadcrumb(butaca)
    end

    def butaca_params
      params.require(:butaca).permit :uid,
                                     :detail,
                                     :price
    end
  end
end
