require_relative './authorize_service.rb'

module Service
  class ClientService
    attr_reader :client
  
    def initialize
      @client = AuthorizeService.new.session
    end
  
    def stars
      client.stars_list["items"]
    end
  end
end
