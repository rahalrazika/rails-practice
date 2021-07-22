module LikesHelper
    def like_or_unlike(event, like)
   
          if like 
            button_to "☆ unlike", event_like_path(event, like), method: :delete 
          else 
            button_to "★ like", event_likes_path(event)
           end 
        end
     
    end