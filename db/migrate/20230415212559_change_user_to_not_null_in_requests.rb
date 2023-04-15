class ChangeUserToNotNullInRequests < ActiveRecord::Migration[7.0]
  def change
    change_column_null :requests, :user_id, false
  end
end
