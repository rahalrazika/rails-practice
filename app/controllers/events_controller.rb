class EventsController < ApplicationController
  before_action :require_signin, except: %i[index show]
  before_action :require_admin, except: %i[index show]
  before_action :set_event, only: %i[show update edit destroy]

  def index
    case params[:filter]
    when 'past'
      @events = Event.past
    when 'free'
      @events = Event.free
    when 'recent'
      @events = Event.recent
    else
      @events = Event.upcaming
    end
  end

  def show
    
    @likers = @event.likers
    @categories = @event.categories 
    if current_user
      @like = current_user.likes.find_by(event_id: @event.id)
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event successfully updated'
    else
      render :edit
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event, notice: 'Event successfully created'
    else
      render :new
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private
   def set_event
    @event = Event.find_by!(slug: params[:id])
   end
  def event_params
    params.require(:event).permit(:name, :location, :description, :price, :start_at, :capacity, 
                                  :image_file_name, category_ids: [])
  end
end
