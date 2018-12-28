require 'Logger'

module Service
  class LogService
    attr_reader :log
  
    def initialize
      @log = Logger.new(STDOUT)
    end
  
    def info(message)
      log.info(message)
    end
  
    def error(message)
      log.error(message)
    end
  end
end
