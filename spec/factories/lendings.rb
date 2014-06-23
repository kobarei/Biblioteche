FactoryGirl.define do
  # factory :user_publication
  factory :child_child_lending_1, class: Lending do
    id 1
    user_id 1
    book_id 1
  end

  factory :child_adult_lending_1, class: Lending do
    id 2
    user_id 1
    book_id 2
  end

  factory :child_child_lending_2, class: Lending do
    id 3
    user_id 1
    book_id 1
  end

  factory :child_child_lending_3, class: Lending do
    id 4
    user_id 1
    book_id 3
  end

  factory :adult_child_lending_1, class: Lending do
    id 5
    user_id 2
    book_id 1
  end

end
