module EventsHelper

def main_image(event)
  if event.main_image.attached?
     image_tag event.main_image
  else
    image_tag "placeholder" 
  end
end

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