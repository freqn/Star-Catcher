require_relative './authorize.rb'

class Client
  attr_reader :client

  def initialize
    @client = Authorize.new.session
  end

  def stars_list
    client.stars_list["items"]
  end
end