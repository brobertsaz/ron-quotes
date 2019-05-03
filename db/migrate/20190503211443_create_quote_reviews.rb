class CreateQuoteReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :quote_reviews do |t|
      t.references :quote, foreign_key: true, null: false
      t.integer :rating, null: false
      t.string :rating_ip, null: false
      t.timestamps
    end
  end
end
