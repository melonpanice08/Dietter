class AddTargetWeightToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :target_weight, :float
  end
end
