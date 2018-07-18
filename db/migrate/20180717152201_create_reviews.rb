class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :reviewOn, index: true, foreign_key: true
      t.references :reviewBy, index: true, foreign_key: true
      t.text :comment

      t.timestamps null: false
    end
  end
end
