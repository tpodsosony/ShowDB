class AddOverviewToSeasons < ActiveRecord::Migration[7.2]
  def change
    add_column :seasons, :overview, :string
  end
end
