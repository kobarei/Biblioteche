class User < ActiveRecord::Base
  include Biblio::Subdomain

  belongs_to :library
end
