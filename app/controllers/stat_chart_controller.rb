class StatChartController < ApplicationController
   def new
      @stats = StatChart.new
   end
   def create
      #start each stat_chart with 0 wins 0 losses
      @stats = StatChart.create(wins: 0, losses: 0, wpm: 0)
      @stats.user = current_user
   end
   def show

   end
   def update

   end
   def destroy

   end
   private

end
