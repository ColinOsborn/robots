ENV['RACK_ENV'] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'tilt/erb'
require 'capybara/dsl'

module TestHelpers
  def teardown
    robot_repository.delete_all
    super
  end

  def robot_repository
    database = YAML::Store.new('db/robot_repository_test')
    @robot_repository ||= RobotRepository.new(database)
  end
end

Capybara.app = RobotWorldApp

class FeatureTest < Minitest::Test
  include Capybara::DSL
  include TestHelpers
end
