FactoryGirl.define do
  factory :player do
    # name "fromRags2bitches"
    steam_id "76561198015466913"
  end

  factory :player_with_item, parent: :player do |player|
    sequence :steam_id
    player.after(:create) do |p|
      p.items << create :strange_festive_knife
    end
  end

end
