class AddBoughtByToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :bought_by, :integer
  end
end
