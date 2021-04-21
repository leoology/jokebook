module JokesHelper
    def format_h2
        if params[:comedian_id]
            content_tag(:h2, "#{@comedian.name}'s Jokes")
        else
            content_tag(:h2, "Jokes") 
        end
    end
end
