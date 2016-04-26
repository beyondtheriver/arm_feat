# require 'bcrypt'
class User < ActiveRecord::Base
   has_many :attempts
   has_secure_password
   has_attached_file :avatar, default_url: "/images/default_photo.jpg"
   validates_presence_of :username, :email
   validates_uniqueness_of :username, :email
   validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

end
