class AnalysesController < ApplicationController
    #before_action :set_analyse, only: %i[ show update destroy ]

    def index
        @analyzes = Analyse.all

        
        if @analyzes.size > 0
            #render json: {data: @analyzes, message: 'Análises encontradas'}
            #render json: @analyzes.to_json(include: :benefited)
            render json: {data: @analyzes, message: 'Análises encontradas'}.to_json(include: :benefited)
        else
            render json: {data:[], message: 'Nenhuma análise encontrada'}, status: :no_content
        end
    end

    def show
        @analyse = Analyse.includes([:analysis_results,:benefited]).find(params[:id])

        render json: @analyse.to_json(root: "data", include: [:benefited, :analysis_results])
        #render json: {data: analyse_full}
    end

end
