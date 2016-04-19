class Word < ActiveRecord::Base

   before_create :generate_length

   def generate_length
      puts "generating length"
      self.length = self.text.length
   end
end
