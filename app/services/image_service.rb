require 'base64'
require 'mime/types'

class ImageService
    def self.save_image(binary_data,file_name)
        image_format = get_image_format(binary_data)
        File.open('images/'+ file_name.to_s + image_format.to_s ,'wb') do |file|
            file.write(binary_data)
        end
        ## salva imagem diretorio
        ## retorna alguma chave para rastrear a imagem de volta
    end

    ## moca analise da imagem
    def self.analyse_image(image_path)
      ## chamar  .py
      result = `python3 app/services/image_analyse.py #{image_path}`
      result = JSON.parse(result)
      return result
    end

    def self.convertBase64ToImage(base64_string)
        binary_data = Base64.decode64(base64_string)
        binary_data
    end

    def self.get_image_format(binary_data)
        return '.png'
    end
end