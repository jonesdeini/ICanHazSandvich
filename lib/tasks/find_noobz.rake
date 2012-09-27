require "benchmark"

task :find_noobz => %w( xxl_noobz_refactor lotus_noobz gameliberty_noobz )

desc "find xxl noobz"
task :xxl_noobz => :environment do |task|
  puts task.full_comment
  puts Benchmark.measure { XxlScraper.scrape }
end

desc "find xxl noobz refactor"
task :xxl_noobz_refactor => :environment do |task|
  puts task.full_comment
  puts Benchmark.measure { XxlScraperRefactor.new }
end

desc "find lotus noobz"
task :lotus_noobz => :environment do |task|
  puts task.full_comment
  LotusScraper.new
end

desc "find gameliberty noobz"
task :gameliberty_noobz => :environment do |task|
  puts task.full_comment
  GamelibertyScraper.new
end
