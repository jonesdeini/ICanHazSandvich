task :find_noobz => %w( xxl_noobs )

desc "find xxl noobz"
task :xxl_noobs => :environment do |task|
  puts task.full_comment
  XxlScraper.scrape
end
