class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :genre
      t.string :book_description
      t.integer :book_cost

      t.timestamps
    end
  end
end
