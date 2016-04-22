class Attempt < ActiveRecord::Base
   belongs_to :user
   has_many :words
   has_one :user_score

   before_create :generate_attribute_values

   def generate_attribute_values
      self.level = 1
      self.boss_id = 1
   end

end
