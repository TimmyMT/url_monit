class AddIndexToUrlItems < ActiveRecord::Migration[6.0]
  def change
    add_index :url_items, :url, unique: true
  end
end
