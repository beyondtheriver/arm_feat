class AttemptsController < ApplicationController
   def index
      @attempts = Attempt.all
   end

   # def new
   #    @attempt = Attempt.new
   # end

   def create
      @attempt = Attempt.create(attempt_params)
      redirect_to attempt_path
   end

   def show
      @attempt = Attempt.find(params[:id])
      words = Word.all.limit(10).shuffle
      @word = words.first
      if session[:score]
      @score = session[:score]
      else
      @score = session[:score] = 0
   end
   end

   def edit
      @attempt = Attempt.find(params[:id])
   end
   def update
      @attempt = Attempt.find(params[:id])
      @attempt.update_attributes(attempt_params)
      redirect_to edit_attempt_path(@attempt)
   end

   def destroy
      @attempt = Attempt.find(params[:id])
      @attempt.destroy
      redirect_to attempts_path
   end

   def check_word
   puts "PARAMS ARE: #{params}"
   if params[:answer] == params[:word].downcase
      session[:score] += 1
      redirect_to attempt_path(a.id), notice: "Word complete!"

   else
      session[:score] -= 1
      redirect_to attempt_path(a.id), notice: "Try again!"

   end
end

   private

   def attempt_params
    params.require(:attempt).permit(:user_id, :level, :boss_id)
   end
end
