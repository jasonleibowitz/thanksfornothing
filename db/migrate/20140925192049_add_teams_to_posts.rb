class AddTeamsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :team_id, :integer
    add_index :posts, :team_id
  end
end
