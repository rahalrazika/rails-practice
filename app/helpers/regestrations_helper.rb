module RegestrationsHelper
  def register_or_sold_out(event)
    if event.sold_out?
      "Sold Out"
    else
      link_to  "Regester?", new_event_regestration_path(event)
    end
  end  
end