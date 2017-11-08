module ApplicationHelper
  def date_helper(date)
    if logged_in? && !current_user.time_zone.blank?
      date.in_time_zone(current_user.time_zone)
    end

    date.strftime("%b %e, %l:%M %p %Z")
  end
end
