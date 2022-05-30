class WordsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_word, only: :show

  def index
    @words = current_user.words.order(updated_at: :desc)
  end

  def new
    @word = current_user.words.new
  end

  def create
    @word = current_user.words.new(word_params)

    respond_to do |format|
      if @word.save
        format.html { redirect_to words_path(@word), notice: t(".success") }
        format.json { render :show, status: :created, location: @word }
      else
        format.html {
          flash[:alert] = @word.errors.full_messages.to_sentence
          render :new
        }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit

  end

  def show

  end

  def destroy

  end

  private

  def find_word
    @word = current_user.words.find(params[:id])
  end

  def word_params
    params.require(:word).permit(:title, :description, :tag_list)
  end
end
