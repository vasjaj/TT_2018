class AddInfoToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :adress_from, :string, null:false, default: ""
    add_column :items, :adress_to, :string
    add_column :items, :price, :decimal, null: false, default: ""
    add_column :items, :send_started, :datetime
    add_column :items, :send_finished, :datetime
    add_column :items, :courier_fee, :decimal, default: 0.00
  end
end
