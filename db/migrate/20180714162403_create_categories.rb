class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :max_length
      t.integer :max_width
      t.integer :max_height
      t.integer :max_weight

      t.timestamps null: false
    end
  end
end
