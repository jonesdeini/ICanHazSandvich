ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require "rails/test_help"
require "minitest/rails"
# require "minitest/autorun"
# require "minitest/rails/capybara"
require "nyancat-test"

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
