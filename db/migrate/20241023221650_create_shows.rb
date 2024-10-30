class CreateShows < ActiveRecord::Migration[7.2]
  def change
    create_table :shows do |t|
      t.string :title
      t.text :overview
      t.string :image
      t.integer :show_id
      t.decimal :avg_rating

      t.timestamps
    end
  end
end
