class PingUrlItem
  def self.call(url_item)
    started_timer = Time.current
    RestClient.get(url_item.url, headers = {})
    response_time = (Time.current - started_timer).seconds

    update_url_item(url_item, response_time)
  rescue OpenSSL::SSL::SSLError
    url_item.update(listening: false)
  end

  private

  def self.update_url_item(url_item, response_time)
    UrlItem.transaction do
      url_item.response_times.shift if url_item.response_times.count == 3
      url_item.response_times << response_time.round(1)
      url_item.active = true if url_item.response_times.last <= 0.7
      url_item.active = false if url_item.response_times.last >= 0.7
      url_item.save!
    end
  end
end