class CreateSeasons < ActiveRecord::Migration[7.2]
  def change
    create_table :seasons do |t|
      t.string :season_name
      t.integer :number_of_episodes
      t.string :poster_path
      t.decimal :vote_average
      t.references :show_details, null: false, foreign_key: true

      t.timestamps
    end
  end
end
