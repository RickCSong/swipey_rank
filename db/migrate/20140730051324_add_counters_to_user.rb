class AddCountersToUser < ActiveRecord::Migration
  def change
    add_column :users, :max_score, :integer, default: 0
    add_column :users, :max_backflips, :integer, default: 0
    add_column :users, :time_spent, :integer, default: 0

    reversible do |dir|
      dir.up do
        User.all.each do |user|
          user.update_attributes(
            max_score: user.games.order('score DESC').first.score,
            max_backflips: user.games.order('backflips DESC').first.score,
            time_spent: user.games.sum(:duration)
          )
        end
      end
    end
  end
end
