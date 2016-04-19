class WordsController < ApplicationController
   def index
      @words = Word.all
   end

   def new
      @word = Word.new
   end

   def create
      # self.length = self.text.length
      @word = Word.create(word_params)
      redirect_to new_word_path
   end

   def show
      @word = Word.find(params[:id])
   end

   def edit
      @word = Word.find(params[:id])
   end
   def update
      @word = Word.find(params[:id])
      @word.update_attributes(word_params)
      redirect_to edit_word_path(@word)
   end

   def destroy
      @word = Word.find(params[:id])
      @word.destroy
      redirect_to words_path
   end

   private

   def word_params
    params.require(:word).permit(:text, :difficulty, :length)
   end
end
