require_relative './client_service.rb'
require_relative './log_service.rb'

module Service
  class FileGeneratorService
    attr_reader :client, :log

    def initialize
      @log = LogService.new
      @client = ClientService.new
    end

    def get_starred
      client.stars
    end

    def generate
      File.open("../data/data.txt","w") do |f|
        generate_file(f)
      end
      log_success
    end
    
    private
  
    def generate_file(file)
      @id = 0
      get_starred.each do |x|
        if data_valid?(x)
          item =    structured_data(x)
          record =  formatted_data(item)
          file.write("#{record}\n")
        end
      end
    end

    def data_valid?(x)
      x["message"]["attachments"] ? true : false
    end
  
    Data = Struct.new(:id, :title, :desc, :link)
  
    def structured_data(item)
      Data.new(@id += 1,
              item["message"]["attachments"][0]["title"] || "",
              item["message"]["attachments"][0]["text"] || "",
              item["message"]["attachments"][0]["title_link"] || "")
    end
  
    def formatted_data(item)
      { id:     item.id,
        title:  item.title,
        desc:   item.desc,
        link:   item.link
      }
    end
    
    def log_success
      log.info("DONE! Your file is now ready in the data directory!")
    end
  end
end