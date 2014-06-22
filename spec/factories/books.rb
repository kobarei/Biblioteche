# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :child_book_1, class: Book do
    id 1
    name "Wagahai ha Neko"
    author "Natsume Souseki"
    library_id 1
    age_limit 0
    isbn "aa"
    count 2
  end

  factory :adult_book_1, class: Book do
    id 2
    name "Somaria"
    author "Akasaka Kenji"
    library_id 1
    age_limit 18
    isbn "bb"
    count 1
  end
end
