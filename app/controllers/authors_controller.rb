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
        print(params[:id])
        @author = Author.find_by first_name: params[:id]
        redirect_to root_path, notice: 'Folgender Author wurde gefunden: ' + @author.first_name + " " + @author.last_name + " " + @author.homepage
    end

    def author_params
        params.require(:author).permit(:first_name, :last_name, :homepage)
    end
end
