class AuthorsController < ApplicationController
    def create
        @author = Author.new(author_params)
        @author.save
        redirect_to root_path, notice: 'Success!'
    end 

    def show
        @author = FactoryBot.create :author
        puts(@author)
        redirect_to root_path, notice: 'Folgender Author wurde gefunden: ' + @author.first_name + " " + @author.last_name + " " + @author.homepage
    end

    def author_params
        params.require(:author).permit(:first_name, :last_name, :homepage)
    end
end
