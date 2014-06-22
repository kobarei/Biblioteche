FactoryGirl.define do
  factory :child_publication_1, class: Publication do
    id 1
    name "Wagahai ha Neko"
    author "Natsume Souseki"
    library_id 1
    age_limit 0
    category "Book"
    count 2
  end

  factory :adult_publication_1, class: Publication do
    id 2
    name "Somaria"
    author "Akasaka Kenji"
    library_id 1
    age_limit 18
    category "Book"
    count 1
  end
end
