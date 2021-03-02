# frozen_string_literal: true

Dir[File.join(Config.root_path, "app", "lib", "*.rb")].each { |file| require(file) }
