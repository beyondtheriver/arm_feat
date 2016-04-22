class AttemptsController < ApplicationController
   def index
      @attempts = Attempt.all
   end

   def new
      @attempt = Attempt.create(score: 0)
      current_user.attempts.push @attempt
      redirect_to @attempt
   end

   # def create
   #    @attempt = Attempt.create(attempt_params)
   #    redirect_to attempt_path
   # end

   def show
      @attempt = Attempt.find(params[:id])
      words = Word.all.limit(20).shuffle
      @word = words.first
      # @attempt.user_score = !@attempt.user_score.nil? ? @attempt.user_score : 0;

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
      @attempt = Attempt.find(params[:attempt])
      puts "PARAMS ARE: #{params}"


   if params[:answer] == params[:word].downcase
      @attempt.score += 1
      @attempt.save
      flash[:notice] = "You typed the word correctly!"
      if @attempt.score >= 10
         flash[:notice] = "YOU WON!"
      end
   else
      @attempt.score -= 1
      @attempt.save
      flash[:notice] = "The computer is faster than you!"
      if @attempt.score <= -10
         flash[:notice] = "YOU LOSE!"
      end
   end
   if @attempt.score < 10 && @attempt.score > -10
      redirect_to attempt_path(@attempt.id)
   else
      redirect_to root_path
   end
end

   private

   def attempt_params
    params.require(:attempt).permit(:user_id, :level, :boss_id)
   end
end
