class LikesController < ApplicationController
    def create
     @event = Event.find_by!(slug: params[:event_id])
      @event.likes.create!(user: current_user)
      redirect_to @event
    end

    def destroy
      like = current_user.likes.find(params[:id])
      like.destroy

      @event = Event.find_by!(slug: params[:event_id])

      redirect_to @event
    end
end
