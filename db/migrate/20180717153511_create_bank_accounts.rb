class CreateBankAccounts < ActiveRecord::Migration
  def change
    create_table :bank_accounts do |t|
      t.integer :ISBN
      t.string :accountHolder
      t.references :userID, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
