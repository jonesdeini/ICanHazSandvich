ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)

require "minitest/autorun"
require "minitest/rails"
require "minitest/rails/capybara"
require "minitest/pride"

MiniTest::Rails.override_testunit!

#FactoryGirl.find_definitions

class MiniTest::Unit::TestCase
  include FactoryGirl::Syntax::Methods
end