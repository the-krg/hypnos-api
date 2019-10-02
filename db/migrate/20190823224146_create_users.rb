class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.datetime :birthdate
      t.integer :height
      t.integer :weight
      t.string :scholarity
      t.string :profession
      t.string :transportation
      t.string :neighborhood
      t.boolean :smoker
      t.boolean :take_meds

      t.timestamps
    end
  end
end
