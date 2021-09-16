class UrlItem < ApplicationRecord
  URL_FORMAT = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/i

  validates :url, presence: true
  validates :url, uniqueness: true
  validates_format_of :url, with: URL_FORMAT, multiline: true
end
