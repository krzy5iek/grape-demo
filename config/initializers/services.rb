# frozen_string_literal: true

Dir[File.join(Config.root_path, "app", "services", "**", "*.rb")].each { |file| require(file) }
