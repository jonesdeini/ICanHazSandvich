require 'typhoeus'

desc "refresh all players"
task :refresh_noobz => :environment do |task|
  puts "#{task.full_comment} player count: #{Player.count}"

  hydra = Typhoeus::Hydra.new(max_concurrency: 8)
  Player.all.each do |player|
    BackpackRetriever.new hydra, 0, player.steam_id
  end
  hydra.run
  puts "#{task.full_comment} player count: #{Player.count}"
end
