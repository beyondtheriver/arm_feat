class StatChartController < ApplicationController
   def create
      #start each stat_chart with 0 wins 0 losses
      @stats = StatChart.create(wins: 0, losses: 0, wpm: 0)
      @stats.user = current_user
   end
end
