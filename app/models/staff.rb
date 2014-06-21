class Staff < ActiveRecord::Base
  has_secure_password
  belongs_to :library
end
