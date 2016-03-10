class AddTimeStampsToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :timedate, :timestamps
  end
end
