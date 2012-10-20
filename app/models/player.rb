class Player < ActiveRecord::Base
  require 'net/http' 

# callbacks
#  after_create :get_player_info

# associations
  has_many :inventories
  has_many :items, :through => :inventories

# constants
  GET_PLAYER_INFO_API_CALL = "http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key="

# validations
  validates_uniqueness_of :steam_id

# scopes
  scope :sort_by_updated_at, order('updated_at')
  scope :sort_by_inv_count, order('inventories_count')
  scope :sort_by_bp_slots, order('bp_slots')
  scope :sort_by_single_inv_count, where(inventories_count: 1)

# class methods
  def self.sort_scope(sort_key)
    sort_key ||= "updated_at"
    send("sort_by_#{sort_key}")
  end

# instance methods
  def get_player_info
    url = GET_PLAYER_INFO_API_CALL + APP_CONFIG["api_key"] + "&steamids=#{steam_id}"
    raw_json = Net::HTTP.get_response(URI.parse(url)).body
    json = JSON.parse raw_json
    json["response"]["players"].each do |player|
      self.name = player["personaname"]
      self.avatar = player["avatarmedium"]
      save
    end
  end
  handle_asynchronously :get_player_info

end
