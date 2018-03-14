class User < ApplicationRecord
  # attr_accessible :first_name, :last_name, :username, :email, :phone_number

attr_accessor :email

validates_confirmation_of :email
validates :email, :on => :create, :presence => true, :uniqueness => true
validates :username, :presence => true, :uniqueness => true

def self.authenticate(username, email)
  user=find_by_email(email)
  if user && user.email == email
    user
  else
    nil
  end
end
end
