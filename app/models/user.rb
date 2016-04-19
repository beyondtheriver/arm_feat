# require 'bcrypt'
class User < ActiveRecord::Base
   has_many :attempts
   has_secure_password

   validates_presence_of :username, :email
   validates_uniqueness_of :username, :email

   # users.password_hash in the database is a :string

  # include BCrypt

  # def password
  #  @password ||= Password.new(password_hash)
  # end

  # def password=(new_password)
  #  @password = Password.create(new_password)
  #  self.password_hash = @password
  # end
end
