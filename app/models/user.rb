class User < ActiveRecord::Base
   has_secure_password
   has_attached_file :avatar, default_url: "default_photo.jpg"

   has_many :attempts
   has_one :stat_chart

   validates :username, :email, presence: true, uniqueness: true
   validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

   before_create :provide_stat_chart

private

   def provide_stat_chart
      self.stat_chart = StatChart.create(wins: 0, losses: 0, wpm: 0)
   end
end
