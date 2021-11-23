class AuthorsController < ApplicationController
    def new
    end
    def create 
        @author = Author.new(params[:author])
 
        @author.save
        redirect_to root_path, notice: 'Success!'
    end 
end
