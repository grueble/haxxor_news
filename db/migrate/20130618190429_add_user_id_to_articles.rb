class AddUserIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :user_id, :string, :null => false
  end
end
