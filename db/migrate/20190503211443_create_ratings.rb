class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.references :quote, foreign_key: true, null: false
      t.integer :score, null: false
      t.string :rating_ip, null: false
      t.timestamps
    end
  end
end
