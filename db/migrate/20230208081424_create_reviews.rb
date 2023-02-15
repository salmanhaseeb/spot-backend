class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :spot, null: false, foreign_key: true
      t.string :reviewer_name, null: false
      t.string :comment
      t.integer :star, null: false
      t.timestamps
    end
  end
end
