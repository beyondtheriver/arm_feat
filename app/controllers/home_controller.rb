class HomeController < ApplicationController
 def index
   word_ids = Word.pluck(:id)
   id = word_ids.shuffle.first
   @word = Word.find(id)

   if session[:score]
      @score = session[:score]
   else
      @score = session[:score] = 0
   end
end

def check_word
   puts "PARAMS ARE: #{params}"
   if params[:answer] == params[:word].downcase
      session[:score] += 1
      redirect_to root_path, notice: "Word complete!"

   else
      session[:score] -= 1
      redirect_to root_path, notice: "Try again!"

   end
end

   # def new_word
   #    self.length = self.text.length
   #    @word = Word.create(word_params)
   #    redirect_to root_path
   # end
end
