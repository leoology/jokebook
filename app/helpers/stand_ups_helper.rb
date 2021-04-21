module StandUpsHelper
    def format_header
         if params[:comedian_id]
            content_tag(:h2, "#{@comedian.name}'s Stand Up Bits")
            else
        content_tag(:h2, "Stand Up Bits")
        end
    end
end 

