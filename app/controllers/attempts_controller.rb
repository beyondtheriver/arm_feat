class AttemptsController < ApplicationController
   def index
      @attempts = Attempt.all
   end

   def new
      @attempt = Attempt.create(score: 0)
      current_user.attempts.push @attempt
      redirect_to @attempt
   end

   def show
      @attempt = Attempt.find(params[:id])
      words = Word.all.limit(30).shuffle
      @word = words.first
      if params[:arm_x]
         @arm_x = params[:arm_x]
      else
         @arm_x = 0
      end

      puts 'arm_x: ' + @arm_x.to_s
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
      flash[:notice] = "You typed correctly!"
      if @attempt.score >= 10
         flash[:notice] = "YOU WON!"
         @stats = current_user.stat_chart
         @stats.wins +=1
         @stats.save
      end
   else
      @attempt.score -= 1
      @attempt.save
      flash[:notice] = "The computer is faster!"
      if @attempt.score <= -10
         flash[:notice] = "YOU LOSE!"
         @stats = current_user.stat_chart
         @stats.losses += 1
         @stats.save
      end
   end
   if @attempt.score < 10 && @attempt.score > -10
      redirect_to attempt_path(@attempt.id, arm_x: params[:arm_x])
   else
      redirect_to user_path(current_user)
   end
end

   private

   def attempt_params
    params.require(:attempt).permit(:user_id, :level, :boss_id)
   end
end
