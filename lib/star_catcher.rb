require_relative './services/file_generator_service.rb'

class StarCatcher
  include Service
  
  def self.generate
    FileGeneratorService.new.generate
  end
end

StarCatcher.generate