class AddSignToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :sign, :integer, :null => false, :default => 1
  end
end
