guard 'spork', :cucumber => false, :rspec => false, :minitest => true do
  watch('config/application.rb')
  watch('config/environment.rb')
  watch(%r{^config/environments/.+\.rb$})
  watch(%r{^config/initializers/.+\.rb$})
  watch('Gemfile')
  watch('Gemfile.lock')
  watch('test/minitest_helper.rb') { :minitest }
end

guard 'minitest', :color => true, :drb => true do

  watch(%r|^test/controllers/(.*)_test\.rb|)
  watch(%r|^test/models/(.*)_test\.rb|)
  watch(%r|^test/helpers/(.*)_test\.rb|)
  watch(%r|^test/acceptance/(.*)_test\.rb|)

  # Rails 3.2
  watch(%r|^app/controllers/(.*)\.rb|) { |m| "test/controllers/#{m[1]}_test.rb" }
  watch(%r|^app/helpers/(.*)\.rb|)     { |m| "test/helpers/#{m[1]}_test.rb" }
  watch(%r|^app/models/(.*)\.rb|)      { |m| "test/models/#{m[1]}_test.rb" }  

  watch('test/minitest_helper.rb') { :minitest }
end
