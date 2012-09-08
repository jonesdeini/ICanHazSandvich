FactoryGirl.define do
  factory :item do
    sequence :defindex
    # NOTE need parens for syntastic?
    sequence(:name) { |n| "strange #{n}" }
  end
end
