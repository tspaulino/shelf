class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :user
      t.integer :rate, :default => 1, :null => false
      t.belongs_to :book

      t.timestamps
    end
    add_index :reviews, :user_id
    add_index :reviews, :book_id
  end
end
