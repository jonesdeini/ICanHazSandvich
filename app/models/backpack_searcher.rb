require 'net/http'
require 'typhoeus'

class BackpackSearcher

  def initialize(json, steam_id)
    search! json, steam_id
  end

  # TODO make total_items scope on Player and delete when 0
  def search!(json, steam_id)
    puts "searching #{steam_id} bp" unless Rails.env == "test"
    if json["result"]["status"] == 1

      # if the player already exists 
      p = Player.find_or_initialize_by_steam_id steam_id
      if p.new_record?
        puts p.errors.full_messages.to_sentence unless p.save
      else
        p.inventories.delete_all
      end

      BaseItem.all.each do |item|
        if item.search json
            puts "bro"
          if p.items.include? item
            inv = p.inventories.find_by_item_id item.id
            inv.item_count = inv.item_count + 1
            inv.save
          else
            p.items << item
          end
        end
      end

      p.delete unless p.items.any?
    else
      puts "id: #{steam_id} has a private bp"
    end
  end

end
