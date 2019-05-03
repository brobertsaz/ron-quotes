class AddWordCountToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :word_count, :integer
  end
end
