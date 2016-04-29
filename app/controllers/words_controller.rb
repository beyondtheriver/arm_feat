class WordsController < ApplicationController
   before_action :load_resource, only: [:show, :edit, :update, :destroy]

   def index
      @words = Word.all
   end

   def new
      @word = Word.new
   end

   def create
      @word = Word.create(word_params)
      redirect_to new_word_path
   end

   def edit
   end

   def update
      @word.update_attributes(word_params)
      redirect_to edit_word_path(@word)
   end

   def destroy
      @word.destroy
      redirect_to words_path
   end

private

   def load_resource
      @word = Word.find(params[:id])
   end

   def word_params
      params.require(:word)
            .permit(:text, :difficulty, :length)
   end
end
