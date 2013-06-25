# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin do
    email    "admin@nds.org"
    password "password"
  end
end
