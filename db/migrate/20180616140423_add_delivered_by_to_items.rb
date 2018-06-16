class AddDeliveredByToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :delivered_by, :integer
  end
end
