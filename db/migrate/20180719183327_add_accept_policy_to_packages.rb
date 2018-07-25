class AddAcceptPolicyToPackages < ActiveRecord::Migration
  def change
    add_column :packages, :acceptPolicy, :boolean
  end
end
