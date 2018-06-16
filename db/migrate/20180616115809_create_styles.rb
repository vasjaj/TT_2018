class CreateStyles < ActiveRecord::Migration[5.2]
  def change
    create_table :styles do |t|
      t.string :bg_color, null: false, default: "white"
      t.integer :font_size, null: false, default: 1
      t.string :font_style
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
