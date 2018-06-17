class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.datetime :changed_at
      t.string :field
      t.string :chaged_by

      t.timestamps
    end
  end
end
