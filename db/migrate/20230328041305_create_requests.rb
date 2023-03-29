class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.string :title
      t.integer :media_type
      t.text :notes

      t.timestamps
    end
  end
end
