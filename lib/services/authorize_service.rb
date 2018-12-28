require_relative './log_service.rb'
require 'slack'

module Service
  class AuthorizeService
    attr_reader :log
  
    def initialize
      @log = LogService.new
    end
  
    def session
      authenticate
    end
  
    private
  
    def authenticate
      return log.error('INVALID TOKEN') if token.nil?
      log.info("Authenicating...")
      token ? Slack::Client.new(token: token) : quit
    end
    
    def token
      key = ENV['SLACK_AUTH_TOKEN']
      key.nil? ? quit : key
    end
  
    def quit
      log.error("INVALID SLACK_AUTH_TOKEN... EXITING")
      exit
    end
  end
end
