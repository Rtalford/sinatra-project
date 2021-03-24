class AddUsersIdToEntries < ActiveRecord::Migration[5.2]
  def change
    add_colunm :entries, :user_id, :integer
  end
end
