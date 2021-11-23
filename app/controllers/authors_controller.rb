class AuthorsController < ApplicationController
    def create
        puts ("Hello World") 
        puts (author_params)
        @author = Author.new(author_params)
        puts(@author)
        @author.save
        redirect_to root_path, notice: 'Success!'
    end 

    def show
        redirect_to root_path, notice: 'Über die Show methode aufgerufen!'
    end

    def author_params
        params.require(:author).permit(:first_name, :last_name, :homepage)
    end
end
