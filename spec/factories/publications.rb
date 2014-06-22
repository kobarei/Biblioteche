FactoryGirl.define do
  factory :child_book_1, class: Publication do
    id 1
    name "Wagahai ha Neko"
    author "Natsume Souseki"
    library_id 1
    isbn "hogehoge"
    age_limit 0
    count 2
  end

  factory :adult_book_1, class: Publication do
    id 2
    name "Somaria"
    author "Akasaka Kenji"
    library_id 1
    isbn "hogefuga"
    age_limit 18
    count 1
  end
end
