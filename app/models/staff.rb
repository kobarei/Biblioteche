class Staff < ActiveRecord::Base
  has_secure_password

  belongs_to :library

  validates :name, presence: true
  validates :login_id, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true, on: :create
  validates :library_id, presence: true

end
