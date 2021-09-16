class CreateUrlItems < ActiveRecord::Migration[6.0]
  def change
    create_table :url_items do |t|
      t.string :url, null: false
      t.boolean :active, null: false, default: false
      t.text :delay, array: true, default: []

      t.timestamps
    end
  end
end
