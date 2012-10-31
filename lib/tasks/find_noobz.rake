require "benchmark"

task :find_noobz => [
                      :drunkenbombers_noobz,
                      # :gameliberty_noobz,
                      :hyperion_noobz,
                      :intox_noobz,
                      :lotus_noobz,
                      :xxl_noobz_refactor
                    ]

desc "can't stop, won't stop findin' them noobz"
task :cant_stop_wont_stop => :environment do |task|
  puts task.full_comment
  while
    DrunkenbombersScraper.new
    # seems to be only idle servers
    #GamelibertyScraper.new
    HyperiongamingScraper.new
    IntoxgamingScraper.new
    LotusScraper.new
    SourceopScrape.new
    XxlScraperRefactor.new
  end
end

desc "find drunken bombers noobz"
task :drunkenbombers_noobz => :environment do |task|
  puts task.full_comment
  DrunkenbombersScraper.new
end

desc "find gameliberty noobz"
task :gameliberty_noobz => :environment do |task|
  puts task.full_comment
  GamelibertyScraper.new
end

desc "find hyperiongaming noobz"
task :hyperion_noobz => :environment do |task|
  puts task.full_comment
  HyperiongamingScraper.new
end

desc "find intoxgaming noobz"
task :intox_noobz => :environment do |task|
  puts task.full_comment
  IntoxgamingScraper.new
end

desc "find lotus noobz"
task :lotus_noobz => :environment do |task|
  puts task.full_comment
  LotusScraper.new
end

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
