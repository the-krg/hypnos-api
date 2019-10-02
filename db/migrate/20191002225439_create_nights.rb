class CreateNights < ActiveRecord::Migration[6.0]
  def change
    create_table :nights do |t|
      t.integer :quality
      t.boolean :different

      t.timestamps
    end
  end
end
