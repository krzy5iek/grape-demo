# frozen_string_literal: true

require "rubygems"
require "bundler/setup"
require "rake"

task :environment do
  ENV["RACK_ENV"] ||= "development"
  require File.expand_path("config/application", __dir__)
end

task console: :environment do
  require "pry"
  ARGV.clear
  Pry.start
end
