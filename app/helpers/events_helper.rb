module EventsHelper
  def price(event)
    if event.free?
      'FREE'
    else
      number_to_currency(event.price)
    end
  end

  def day_and_time(event)
    event.start_at.strftime('%B %d at %I:%M %P')
  end
end