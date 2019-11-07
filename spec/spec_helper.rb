# spec/spec_helper.rb
require 'rack/test'
require 'rspec'

ENV['RACK_ENV'] = 'test'

require File.expand_path('one.rb')

RSpec.configure do |config|
  config.color = true
end
