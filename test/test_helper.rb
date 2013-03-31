ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require "rails/test_help"
require "minitest/rails"
# require "minitest/autorun"
# require "minitest/rails/capybara"
require "nyancat-test"

class MiniTest::Spec
  include FactoryGirl::Syntax::Methods
end

###############
#             #
# Spork Setup #
#             #
###############
require 'spork'

Spork.prefork do

# spork doesnt use this unless it's here
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

end

Spork.each_run do

  # Spork doesn't pickup on changes made to models that are namespaced.
  # e.g. app/models/permissions/blah.rb will not be reloaded.
  # So we have to force it to reload the changes.
  ActionDispatch::Reloader.cleanup!
  ActionDispatch::Reloader.prepare!

  # reload factories
  FactoryGirl.reload

end

#Capybara.register_driver :selenium do |app|
#  Capybara::Selenium::Driver.new(app, :browser => :chrome)
#end
