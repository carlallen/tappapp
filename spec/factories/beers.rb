# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :beer do
    name "Coffee Stout"
    description "Dark and Delicious"
    ibu 30
    srm 37
    abv 8.8
    brewery
  end
end
