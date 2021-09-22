class RenameUsersinfoToUserinfo < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :users_info, :user_info
  end
end
