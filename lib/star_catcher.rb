require_relative './services/file_generator_service.rb'

class StarCatcher
  include Service
  
  def initialize
    FileGeneratorService.new.generate
  end
end

StarCatcher.new