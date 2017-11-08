module PostHelper
  def url_helper(url)
    url.starts_with?('http://') ? url : "http://#{url}"
  end
end