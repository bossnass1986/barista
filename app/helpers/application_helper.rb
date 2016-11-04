module ApplicationHelper

  def title(text)
    content_for :title, text
  end


  def current_day
    return (1.at_..8.hours.from_now).to_a
  end

  def current_week
    today = Date.today
    return (today.at_beginning_of_week..today.at_end_of_week).to_a
  end

  def status(item)
    (item == true) ? "done" : "clear"
  end

  def visibility(item)
    (item == true) ? "visibility" : "visibility_off"
  end

end