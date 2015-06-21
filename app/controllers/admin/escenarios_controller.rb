module Admin
  class EscenariosController < ::AdminController
    include Breadcrumbs

    resource :escenario

    before_action :add_breadcrumbs

    expose :escenarios
    expose :escenario, attributes: :escenario_params
    expose(:periodos) {
      Escenario.periodos.keys
    }

    def create
      if escenario.save
        redirect_to admin_escenarios_path,
                    notice: t("views.escenarios.created")
      else
        render :new
      end
    end

    def update
      if escenario.save
        redirect_to admin_escenarios_path,
                    notice: t("views.escenarios.updated")
      else
        render :edit
      end
    end

    def show
      redirect_to admin_escenario_butacas_path(escenario)
    end

    def destroy
      escenario.destroy
      redirect_to admin_escenarios_path,
                  notice: t("views.escenarios.deleted")
    end

    private

    def escenario_params
      params.require(:escenario).permit :uid,
                                        :periodo
    end
  end
end
