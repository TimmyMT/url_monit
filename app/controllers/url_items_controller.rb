class UrlItemsController < ApplicationController
  def index
    @url_items = UrlItem.all.order(created_at: :desc)
  end

  def new
  end

  def create
    @url_items = UrlItem.all.order(created_at: :desc)
    @url_item = UrlItem.new(url: params[:url])

    if @url_item.valid?
      @url_item.save
    else
      @errors = @url_item.errors.full_messages
    end
  end

  def destroy
    @url_item = UrlItem.find_by(id: params[:id])
    @url_item.destroy if @url_item
  end
end
