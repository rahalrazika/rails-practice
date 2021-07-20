class RegestrationsController < ApplicationController
  before_action :set_event
  def index
    @regestrations = @event.regestrations
  end

  def new
    @regestration = @event.regestrations.new
  end

  def create
    @regestration = @event.regestrations.new(regestration_params)
    if @regestration.save
      redirect_to event_regestrations_url(@event), notice: "Thanks for regestration"
    else
      render :new
    end
  end

  private

  def regestration_params
    params.require(:regestration).permit(:name, :email, :how_heard)
  end
  def set_event 
    @event = Event.find(params[:event_id])
  end
end
