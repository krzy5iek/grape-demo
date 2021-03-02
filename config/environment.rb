# frozen_string_literal: true

ROOT_PATH = File.dirname(File.dirname(__FILE__))
ENV["ROOT_PATH"] = ROOT_PATH
$LOAD_PATH.unshift ROOT_PATH

require "config/config"
Bundler.setup(:default, Config.environment)

require "rubygems"
require "bundler"
require "grape"
require "grape-entity"
require 'grape/middleware/logger'
