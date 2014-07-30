class AddBackflipsToGames < ActiveRecord::Migration
  def change
    add_column :games, :backflips, :integer, default: 0
  end
end
