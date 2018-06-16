class CreateKeywords < ActiveRecord::Migration[5.2]
  def change
    create_table :keywords do |t|
      t.string :word, null: false
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
