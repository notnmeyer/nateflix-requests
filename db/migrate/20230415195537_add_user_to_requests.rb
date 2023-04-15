class AddUserToRequests < ActiveRecord::Migration[7.0]
  def change
    # TODO: remove null: true after all requests have a user
    add_reference :requests, :user, null: true, foreign_key: true
  end
end
