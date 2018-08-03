class AddIsPaidToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :isPaid, :boolean
  end
end
