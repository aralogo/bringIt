class CreateDeliveryOrders < ActiveRecord::Migration
  def change
    create_table :delivery_orders do |t|
      t.references :matchID, index: true, foreign_key: true
      t.boolean :isSigned_Driver
      t.boolean :isSigned_Receiver
      t.timestamp :destiny_date
      t.text :comment

      t.timestamps null: false
    end
  end
end
