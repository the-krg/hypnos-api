class CreateDays < ActiveRecord::Migration[6.0]
  def change
    create_table :days do |t|
      t.datetime :sleep_hour
      t.datetime :wake_hour
      t.integer :quality
      t.boolean :ill
      t.text :description

      t.timestamps
    end
  end
end
