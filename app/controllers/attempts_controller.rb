class AttemptsController < ApplicationController
   before_action :load_resource, only: [:edit, :update, :show, :destroy]
   def index
      @attempts = Attempt.all
   end

   def new
      @attempt = current_user.attempts.create(score: 0)
      redirect_to @attempt
   end

   def show
      words = Word.all.limit(20).shuffle
      @word = words.first
      if params[:arm_x]
         @arm_x = params[:arm_x]
      else
         @arm_x = 0
      end

      puts 'arm_x: ' + @arm_x.to_s
   end

   def update
      @attempt.update_attributes(attempt_params)
      redirect_to edit_attempt_path(@attempt)
   end

   def destroy
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
         @stats = current_user.stat_chart
         @stats.wins +=1
         @stats.save
      end
   else
      @attempt.score -= 1
      @attempt.save
      flash[:notice] = "The computer is faster than you!"
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

   def load_resource
      @attempt = Attempt.find(params[:id])
   end

   def attempt_params
      params.require(:attempt)
            .permit(:user_id, :level, :boss_id)
   end
end
