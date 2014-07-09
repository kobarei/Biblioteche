# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :magazine do
    library nil
    age_limit 1
    status 1
    author "MyString"
    name "MyString"
    count 1
    stock 1
    issn "MyString"
    interval 1
  end
end
