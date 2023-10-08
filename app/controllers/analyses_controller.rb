class AnalysesController < ApplicationController
    #before_action :set_analyse, only: %i[ show update destroy ]

    def index
        @analyzes = Analyse.all

        
        if @analyzes.size > 0
            render json: {data: @analyzes, message: 'Análises encontradas'}.to_json(include: :benefited)
        else
            render json: {data:[], message: 'Nenhuma análise encontrada'}, status: :no_content
        end
    end

    def show
        @analyse = Analyse.includes([:analysis_results,:benefited]).find(params[:id])

        render json: @analyse.to_json(root: "data", include: [:benefited, :analysis_results])
    end

    def create
        @analyse = Analyse.create_new_analyse_and_results(params)
        if @analyse.id
            render json: { message: 'Análise registrada com sucesso' }, status: :created
        else
            render json: { message: @analyse.errors }, status: :unprocessable_entity
        end
    end

    def create_params
        params.permit(
            :benefited_id,
            :responsible,
            :date_analyse,
            :comments,
            :images
        )
    end

    def destroy
        @analyse = Analyse.find(params[:id])
        if @analyse.id
            @results = AnalysisResult.find(@analyse.analysis_result_ids)
            @results.each do |result|
                result.delete
            end
        else
            render json: { message: 'Nenhum análise encontrada' }, status: :not_found
        end
        
        if @analyse.delete
            render json: { message: 'Análise deletada com sucesso'}, status: :no_content
        else
            render json: { message: @analyse.errors }, status: :unprocessable_entity
        end
    end

end
