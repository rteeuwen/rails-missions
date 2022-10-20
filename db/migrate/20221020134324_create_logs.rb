class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.integer :val
      t.integer :result
      t.decimal :runtime

      t.timestamps
    end
  end
end
