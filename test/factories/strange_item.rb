FactoryGirl.define do
  factory :strange_item do
    quality 11
    sequence :defindex
    # NOTE need parens for syntastic?
    sequence(:name) { |n| "strange #{n}" }

    factory :strange_festive_knife do
      defindex 665
      name "strange festive knife"
    end

    factory :strange_festive_wrench do
      defindex 662
      name "strange festive wrench"
    end

  end
end
