require_relative './client_service.rb'
require_relative './log_service.rb'

module Service
  class FileGeneratorService
    attr_reader :client, :log

    def initialize
      @client = ClientService.new.session
      @log    = LogService.new
    end

    
    def generate
      File.open("../data.txt","w") do |f|
        generate_file(f)
      end
      log_success
    end
    
    private
    
    def stars
      client.stars_list["items"]
    end
    
    def generate_file(file)
      @id = 0
      stars.each do |x|
        if data_valid?(x)
          item    = structured_data(x)
          record  = formatted_data(item)
          append(file, record)
        end
      end
    end
    
    def append(file, record)
      file.write("#{record}\n")
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
      log.info("DONE! Your file is now ready in data.txt!")
    end
  end
end