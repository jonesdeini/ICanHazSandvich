namespace :db_one_off do

  desc "remove f2p noobz"
  task :remove_f2p => :environment do |task|
    puts task.full_comment
    api_call = "http://api.steampowered.com/IEconItems_440/GetPlayerItems/v0001/?key="
    start_count = Player.count
    puts "#{task.full_comment} player count: #{start_count}"

    hydra = Typhoeus::Hydra.new(max_concurrency: 8)
    Player.all.each do |p|
      url = api_call + APP_CONFIG["api_key"] + "&steamid=#{p.steam_id}"
      steam_items_request = Typhoeus::Request.new(url)
      steam_items_request.on_complete do |response|
        if response.success?
          backpack = JSON.parse(response.body)
          p.delete if backpack["result"]["num_backpack_slots"] == 50
        else
          puts "steam oh noes!"
        end
      end
      hydra.queue steam_items_request
    end
    hydra.run
    puts "player start count: #{start_count} \n refreshed player count: #{Player.count}"
  end

end
