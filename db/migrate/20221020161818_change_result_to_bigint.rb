class ChangeResultToBigint < ActiveRecord::Migration[5.2]
  def up
    change_column :logs, :result, :text
  end

  def down
    change_column :logs, :result, :integer
  end 
end
