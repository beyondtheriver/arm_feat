# require 'bcrypt'
class User < ActiveRecord::Base
   has_many :attempts
   has_one :stat_chart

   has_secure_password

   has_attached_file :avatar, default_url: "default_photo.jpg"

   validates_presence_of :username, :email
   validates_uniqueness_of :username, :email
   validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

   before_create :provide_stat_chart


   def provide_stat_chart
      self.stat_chart = StatChart.create(wins: 0, losses: 0, wpm: 0)
   end
end
