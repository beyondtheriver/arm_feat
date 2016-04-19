module AttemptsHelper
   def count_all_attempts
      Attempt.all.count
   end
end
