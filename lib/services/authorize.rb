require_relative './log.rb'
require 'slack'

class Authorize
  attr_reader :log

  def initialize
    @log = Log.new
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