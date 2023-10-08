class BenefitedsController < ApplicationController
    before_action :set_benefited, only: [:update]

    def index
        @benefiteds =  Benefited.all
        render json: {data: @benefiteds}
    end

    def destroy
        @benefited = Benefited.find(params[:id])
        if @benefited.id
            if Analyse.where(benefited_id: params[:id]).size > 0 
                render json: { message: 'Beneficiado possui análises feitas, por favor exclua as análises antes de tentar novamente.' }, status: :bad_request
            else
                @benefited.delete
                render json: { message: 'Beneficiado deletado com sucesso'}, status: :no_content
            end
        else
            render json: { message: 'Nenhum beneficiado encontrado' }, status: :not_found
        end
    end

    def create
        @benefited = Benefited.new()
        @benefited.name = params[:name]
        @benefited.contact = params[:contact]
        @benefited.email = params[:email]

        if @benefited.save
            render json: { message: 'Beneficiado registrado com sucesso' }, status: :created
        else
            render json: { message: @benefited.errors }, status: :unprocessable_entity
        end
    end

    def create_params
        params.permit(
            :name,
            :contact,
            :email
        )
    end

    def update
        if @benefited.update(benefited_params)
            render json: @benefited, status: :ok
        else
            render json: { errors: @benefited.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def show
        @benefited = Benefited.find(params[:id])
        render json: {data: @benefited }
    end

    private

    def set_benefited
      @benefited = Benefited.find(params[:id])
    end
  
    def benefited_params
      params.require(:benefited).permit(:name, :contact, :email)
    end
end
