require 'Logger'

module Service
  class LogService
    attr_reader :log
  
    def initialize
      @log = Logger.new(STDOUT)
    end
  
    def info(msg)
      log.info(msg)
    end
  
    def error(msg)
      log.error(msg)
    end
  end
end
