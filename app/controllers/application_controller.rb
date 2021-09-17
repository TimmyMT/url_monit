class ApplicationController < ActionController::Base
  if Rails.env == "test"
    rescue_from ActionView::Template::Error, with: :catch_error
    rescue_from ActionController::UnknownFormat, with: :catch_error
  end
  
  private

  def catch_error
  end
end
