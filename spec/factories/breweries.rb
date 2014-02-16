# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :brewery do
    name "TappApp Brewery"
    location "Minneapolis, MN"
    description "Awesome brewery for testing with rspec."
  end
end
