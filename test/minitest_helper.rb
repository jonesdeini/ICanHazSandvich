ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)

require "minitest/rails"
require "minitest/autorun"
require "minitest/rails/capybara"
require "minitest/pride"

MiniTest::Rails.override_testunit!

# this is included in cas_test_toolkit; if reverting back to
# my fork of factory_girl_rails uncomment this
#class MiniTest::Spec
#    include FactoryGirl::Syntax::Methods
#end

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
