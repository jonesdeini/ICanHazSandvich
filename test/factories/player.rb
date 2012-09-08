FactoryGirl.define do
  factory :player do
    sequence(:steam_id) { |s| "765611980154669#{s}#{s}" }

    factory :player_with_item do
      after(:create) do |p|
        p.items << create(:item)
      end
    end

    factory :player_with_s_f_knife do
      after(:create) do |p|
        p.items << create(:strange_festive_knife)
      end
    end

    factory :player_with_s_f_knife_2 do
      items { [create(:strange_festive_knife)] }
    end

  end
end
