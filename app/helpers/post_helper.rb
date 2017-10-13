module PostHelper
  def date_helper(date)
    date.strftime("%b %e, %l:%M %p")
  end

  def url_helper(url)
    url.starts_with?('http://') ? url : "http://#{url}"
  end
end