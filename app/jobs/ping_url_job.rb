class PingUrlJob < ApplicationJob
  queue_as :default

  def perform(url_item)
    PingUrlItem.call(url_item)
  end
end
