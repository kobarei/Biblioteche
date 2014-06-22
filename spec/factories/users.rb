FactoryGirl.define do
  factory :child_user_1, class: User do
    id 1
    name 'Syoubu'
    library_id 1
    login_id 'syoubu'
    age 0
    password 'password'
  end

  factory :adult_user_1, class: User do
    id 2
    name 'Reiji'
    library_id 1
    login_id 'adult'
    age 22
    password 'password'
  end
end
