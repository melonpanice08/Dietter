class AddTargetBodyfatToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :target_bodyfat, :float
  end
end
