ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)

require "minitest/autorun"
require "minitest/rails"
require "minitest/rails/capybara"
require "minitest/pride"

MiniTest::Rails.override_testunit!

#FactoryGirl.find_definitions

#class MiniTest::Unit::TestCase
class MiniTest::Spec
  include FactoryGirl::Syntax::Methods
end

# MiniTest::Spec doesn't support transactions out-of-the-box
# So we patch it to transact
class MiniTest::Spec

  def run(*agrs, &block)
    value = nil
    ActiveRecord::Base.connection.transaction do
      value = super
      raise ActiveRecord::Rollback
    end
    value
  end

end
