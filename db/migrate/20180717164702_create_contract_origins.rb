class CreateContractOrigins < ActiveRecord::Migration
  def change
    create_table :contract_origins do |t|
      t.references :matchID, index: true, foreign_key: true
      t.boolean :isSigned_Driver
      t.boolean :isSigned_Sender
      t.timestamp :origin_date
      t.text :comment

      t.timestamps null: false
    end
  end
end
