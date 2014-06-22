FactoryGirl.define do
  # factory :user_publication
  factory :child_child_rental, class: Rental do
    id 1
    user_id 1
    publication_id 1
  end

  factory :child_adult_rental, class: Rental do
    id 2
    user_id 1
    publication_id 2
  end
end
