class EventsController < ApplicationController
    def index 
      @events = ["microverse", "datacamp", "hackthon"]
    end
end
