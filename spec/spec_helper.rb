# -*- encoding : utf-8 -*-
ENV['RACK_ENV'] ||= 'test'

require 'rubygems'
#require 'rack/test'
require 'rspec'
require 'simplecov'
require 'json'
require 'test/unit'
require 'vcr'


SimpleCov.start

#require File.expand_path '../../config/environment', __FILE__

Dir[File.expand_path('../support/*.rb', __FILE__)].each do |f|
  require f
end

Dir[File.expand_path('../lib/*.rb', __FILE__)].each do |f|
  require f
end

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  File.read(fixture_path + '/' + file)
end

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock # or :fakeweb
end

class VCRTest < Test::Unit::TestCase
  def test_example_dot_com
    VCR.use_cassette("synopsis") do
      response = Net::HTTP.get_response(URI('http://www.iana.org/domains/reserved'))
      assert_match /Example domains/, response.body
    end
  end
end
