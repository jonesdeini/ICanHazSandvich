FactoryGirl.define do
  factory :player do
    sequence :steam_id
  end

  factory :player_with_item, parent: :player do |player|
    steam_id "76561198015466913"
    player.after(:create) do |p|
      p.items << create(:strange_festive_knife)
    end
  end

end
