namespace :db do
  task :populate_items => %w( populate_meet_the_pyro_items )

  def populator(yml_file, klass)
    list = YAML.load_file("#{Rails.root}/db/items/#{yml_file}")
    list.each do |item|
      new_item = klass.new
      new_item.name = item.first
      new_item.defindex = item.last["defindex"]
      new_item.quality = item.last["quality"].to_f if item.last["quality"]
      new_item.float_value = item.last["float_value"].to_f if item.last["float_value"]
      new_item.save
      puts new_item.name
    end
  end

  desc "populating strange festive weapons"
  task :populate_strange_festive_weapons => :environment do |task|
    puts task.full_comment
    populator("strange_festives.yml", StrangeItem)
  end

  desc "populating hats"
  task :populate_hats => :environment do |task|
    puts task.full_comment
    populator("hats.yml", Hat)
  end

  desc "populating paints"
  task :populate_paints => :environment do |task|
    puts task.full_comment
    populator("paints.yml", Paint)
  end

  desc "populating crates"
  task :populate_crates => :environment do |task|
    puts task.full_comment
    populator("crates.yml", Crate)
  end

  desc "populating meet the pyro items"
  task :populate_meet_the_pyro_items => :environment do |task|
    puts task.full_comment
    populator("meet_the_pyro.yml", Item)
  end

end
