class AddVerificationTokenToGames < ActiveRecord::Migration
  def change
    add_column :games, :verification_token, :integer
  end
end
