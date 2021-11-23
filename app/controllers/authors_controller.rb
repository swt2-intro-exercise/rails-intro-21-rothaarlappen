class AuthorsController < ApplicationController
    def new 
        @author = Author.new
    end
    
    def index 
        @authors = Author.all
    end 

    def edit
        @author = Author.find(params[:id])
    end

    
    def create
        @author = Author.new(author_params)

        if @author.save
            redirect_to root_path, notice: 'Success!'
        else
            render 'new'    
        end    
    end 

    def update
        @author = Author.find(params[:id])
       
        if @author.update(author_params)
          redirect_to @author
        else
          render 'edit'
        end
    end

    def destroy
        @author = Author.find(params[:id])
        @author.destroy
       
        redirect_to author_path
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
