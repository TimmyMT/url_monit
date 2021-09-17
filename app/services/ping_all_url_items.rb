class PingAllUrlItems
  def self.call
    UrlItem.all.each do |item|
      PingUrlJob.perform_now(item)
    end
  end
end