FactoryGirl.define do
  # factory :user_publication
  factory :child_child_reservation_1, class: Reservation do
    id 1
    user_id 1
    book_id 1
  end

  factory :child_adult_reservation_1, class: Reservation do
    id 2
    user_id 1
    book_id 2
  end

  factory :child_child_reservation_2, class: Reservation do
    id 3
    user_id 1
    book_id 1
  end

  factory :child_child_reservation_3, class: Reservation do
    id 4
    user_id 1
    book_id 3
  end

  factory :adult_child_reservation_1, class: Reservation do
    id 5
    user_id 2
    book_id 1
  end

end
