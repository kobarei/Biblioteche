FactoryGirl.define do
  # factory :user_publication
  factory :child_child_lending, class: Lending do
    id 1
    user_id 1
    publication_id 1
  end

  factory :child_adult_lending, class: Lending do
    id 2
    user_id 1
    publication_id 2
  end
end
