class SearchController < ApplicationController
    def search
        @model_name = params[:model_name]
        how = params[:how]
        @word = params[:word]
        if @model_name == "1"
            @user = User.search(how, @word)
        else
            @book = Book.search(how, @word)
        end
    end
    
end