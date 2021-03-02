# frozen_string_literal: true

Dir[File.join(Config.root_path, "app", "repositories", "*.rb")].each { |file| require(file) }
