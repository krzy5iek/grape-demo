# frozen_string_literal: true

Dir[File.join(Config.root_path, "app", "api", "entities", "*.rb")].each { |file| require(file) }
