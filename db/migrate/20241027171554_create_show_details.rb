class CreateShowDetails < ActiveRecord::Migration[7.2]
  def change
    create_table :show_details do |t|
      t.string :name
      t.text :overview
      t.integer :number_of_episodes
      t.integer :number_of_seasons
      t.string :creator

      t.references :show, null: false, foreign_key: true

      t.timestamps
    end
  end
end
