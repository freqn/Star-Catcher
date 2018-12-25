require_relative './services/client.rb'
require_relative './services/log.rb'

class StarCatcher
  attr_reader :client, :log

  def initialize
    @log    = Log.new
    @client = Client.new
    @id     = 0
  end

  def get_starred
    client.stars_list
  end

  def export
    File.open("../data/data.txt","w") do |f|
      get_starred.each do |x|
        if x["message"]["attachments"]
          item = {
            id: @id += 1,
            title:  x["message"]["attachments"][0]["title"] || "",
            desc:   x["message"]["attachments"][0]["text"] || "",
            link:   x["message"]["attachments"][0]["title_link"] || ""
          }
          f.write("#{item}\n")
        end
      end
    end
    log.info("DONE! Your file is now ready in the data directory!")
  end
end

StarCatcher.new.export