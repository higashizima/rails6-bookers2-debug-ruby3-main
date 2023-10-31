class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @search_word = params[:search_word]
    @model = params[:model]
    @method = params[:method]

    if @model == "User"
      @records = User.search_for(@search_word, @method)
    else
      @records = Book.search_for(@search_word, @method)
    end
  end


end

