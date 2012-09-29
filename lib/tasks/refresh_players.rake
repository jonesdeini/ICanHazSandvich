require 'typhoeus'

desc "refresh all players"
task :refresh_noobz => :environment do |task|
  start_count = Player.count
  puts "#{task.full_comment} player count: #{start_count}"

  hydra = Typhoeus::Hydra.new(max_concurrency: 8)
  Player.all.each do |player|
    BackpackRetriever.new hydra, player.steam_id
  end
  hydra.run
  puts "player start count: #{start_count} \n refreshed player count: #{Player.count}"
end
