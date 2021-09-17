class AddColumnToUrlItems < ActiveRecord::Migration[6.0]
  def change
    add_column :url_items, :listening, :boolean, null: false, default: true
  end
end
