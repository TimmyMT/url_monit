class HomeController < ApplicationController
  def index
    @url_items = UrlItem.all.order(created_at: :desc)
  end
end
