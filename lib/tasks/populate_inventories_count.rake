namespace :db_one_off do

  desc "populate_inventories_count"
  task :populate_inventories_count => :environment do |task|
    puts task.full_comment
    puts ("*" * 80), "#{(" " * 30)} WARNING!!!", ("*" * 80),
      "you must comment out the counter_cache on inventories"
    Player.all.each do |p|
      print "."
      p.inventories_count = p.inventories.count
      p.save
    end
  end

end
