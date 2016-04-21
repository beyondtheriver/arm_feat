# require 'bcrypt'
class User < ActiveRecord::Base
   has_many :attempts
   has_secure_password

   validates_presence_of :username, :email
   validates_uniqueness_of :username, :email

end
