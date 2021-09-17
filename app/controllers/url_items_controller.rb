class UrlItemsController < ApplicationController
  before_action :all_items, only: [:index, :create]

  def index
  end

  def new
  end

  def create
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

  private

  def all_items
    @url_items = UrlItem.all.order(created_at: :desc)
  end
end
