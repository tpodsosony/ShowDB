class CreateEpisodes < ActiveRecord::Migration[7.2]
  def change
    create_table :episodes do |t|
      t.string :episode_name
      t.text :overview
      t.integer :episode_number
      t.decimal :vote_average
      t.string :still_path
      t.references :season, null: false, foreign_key: true

      t.timestamps
    end
  end
end
