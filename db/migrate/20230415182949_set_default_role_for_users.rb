class SetDefaultRoleForUsers < ActiveRecord::Migration[7.0]
  def change
    User.where(role: nil).update_all(role: 0)
  end
end
