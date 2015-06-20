module Admin
  class EscenariosController < ::AdminController
    expose :escenarios
    expose :escenario, attributes: :escenario_params

    private

    def escenario_params
      params.require(:escenario).permit :uid,
                                        :periodo
    end
  end
end
