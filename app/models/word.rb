class Word < ActiveRecord::Base
   has_many :attempts

   before_validation :set_defaults, on: :create

   def set_defaults
      puts "generating length"
      self.length = self.text.length
   end
end
