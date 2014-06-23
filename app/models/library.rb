class Library < ActiveRecord::Base

  has_many :users
  has_many :staffs
  has_many :publications

  validates :name, presence: true
  validates :subdomain, presence: true, uniqueness: true

end
