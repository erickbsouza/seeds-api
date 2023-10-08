class Analyse < ApplicationRecord
    belongs_to :benefited
    has_many :analysis_results, :dependent => :destroy

    def self.create_new_analyse_and_results(params)
        @analyse = Analyse.new
        
        ## seta todos os parametros para criar a analise
        @analyse.benefited_id = params[:benefited_id]
        @analyse.date_analyse = params[:date_analyse]
        @analyse.comments = params[:comments]
        @analyse.responsible = params[:responsible]
        ## retorna para ser salvo
        @analyse.save

        params[:images].each_with_index do |image, index|
            file_name = @analyse.id + index
            binary = ImageService.convertBase64ToImage(image)
            ImageService.save_image(binary,file_name)
            ## chama funcao de analise de imagem
            image_path = 'images/' + file_name.to_s
            analyse_result_json = ImageService.analyse_image(image_path)

            @analyse_result = AnalysisResult.new
            @analyse_result.seeds_total = analyse_result_json['seeds_total']
            @analyse_result.high_vigor = analyse_result_json['high_vigor']
            @analyse_result.fungus =  analyse_result_json['fungus']
            @analyse_result.physical_damage = analyse_result_json['physical_damage']
            @analyse_result.wrinkled = analyse_result_json['wrinkled']
            @analyse_result.chemical_damage = analyse_result_json['chemical_damage']

            @analyse_result.analyse_id = @analyse.id
             
            @analyse_result.save

        end
        return @analyse
    end

end
