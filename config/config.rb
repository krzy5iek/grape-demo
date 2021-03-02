# frozen_string_literal: true

class Config
  class << self
    def environment
      @environment ||= ENV.fetch("RACK_ENV", "development")
    end

    def host
      @host ||= ENV.fetch("HOST", "http://localhost:3000")
    end

    def root_path
      @root_path ||= ENV["ROOT_PATH"]
    end
  end
end
