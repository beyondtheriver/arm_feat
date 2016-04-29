class Attempt < ActiveRecord::Base
   belongs_to :user
   has_many :words

   before_validation :set_defaults, on: :create

   def set_defaults
      self.level = 1
      self.boss_id = 1
   end
end
