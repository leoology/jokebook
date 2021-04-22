class ComedianJokesController < ApplicationController
    def favorite
        @joke=Joke.find_by_id(params[:id])
        if current_user.jokes.include?(@joke)
            current_user.jokes.delete(@joke)
        else
            comedian_joke=ComedianJoke.create(comedian: current_user, joke:@joke, rating:params[:rating])      
        end
          redirect_to comedian_jokes_path(current_user)
    end

    
end
