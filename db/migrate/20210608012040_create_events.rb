class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :start_time
      t.string :location
      t.integer :user_id

      t.timestamps
    end
  end
end
