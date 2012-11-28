namespace :db do
  task :populate_items => %w(
                             populate_strange_festive_weapons
                             populate_crates
                             populate_crate30_stranges
                             populate_vintage_lvls
                            )

  def populator(yml_file, klass)
    list = YAML.load_file("#{Rails.root}/db/items/#{yml_file}")
    list.each do |item|
      # new_item = klass.find_or_create_by_name item.first
      # ^^^ this works (no mass asignment error) but I'd rather let the validations handle dupes

      new_item = klass.new
      new_item.name = item.first
      new_item.defindex = item.last["defindex"]
      new_item.quality = item.last["quality"].to_f if item.last["quality"]
      new_item.float_value = item.last["float_value"].to_f if item.last["float_value"]
      new_item.level = item.last["level"] if item.last["level"]
      if new_item.save
        puts "#{new_item.name} saved!"
      else
        puts "#{new_item.name} not saved. Errors: #{new_item.errors.full_messages.to_sentence}"
      end
    end
  end

  desc "populating crates"
  task :populate_crates => :environment do |task|
    puts task.full_comment
    populator("crates.yml", Crate)
  end

  desc "populating stranges from #30 crate"
  task :populate_crate30_stranges => :environment do |task|
    puts task.full_comment
    populator("crate30_stranges.yml", StrangeItem)
  end

  desc "populating hats"
  task :populate_hats => :environment do |task|
    puts task.full_comment
    populator("hats.yml", Hat)
  end

  desc "populating meet the pyro items"
  task :populate_meet_the_pyro_items => :environment do |task|
    puts task.full_comment
    populator("meet_the_pyro.yml", Item)
  end

  desc "populating paints"
  task :populate_paints => :environment do |task|
    puts task.full_comment
    populator("paints.yml", Paint)
  end

  desc "populating strange festive weapons"
  task :populate_strange_festive_weapons => :environment do |task|
    puts task.full_comment
    populator("strange_festives.yml", StrangeItem)
  end

  desc "populating vintage lvls "
  task :populate_vintage_lvls => :environment do |task|
    puts task.full_comment
    populator("vintage_lvl.yml", VintageLvl)
  end

end
