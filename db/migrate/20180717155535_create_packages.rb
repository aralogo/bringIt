class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.references :category, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :status

      t.timestamps null: false
    end
  end
end
