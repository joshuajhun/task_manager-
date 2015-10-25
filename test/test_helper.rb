ENV['RACK_ENV'] ||= 'test'
require 'minitest/autorun'
require 'tilt/erb'


require File.expand_path("../../config/environment", __FILE__)
require 'minitest/autorun'
require 'minitest/pride'

class Minitest::Test
  def teardown
    TaskManager.delete_all
  end
end

Capybara.app = TaskManagerApp
class FeatureTest < Minitest::Test
  include Capybara::DSL
end
