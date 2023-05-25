class ChangeFieldNameToInteger < ActiveRecord::Migration[7.0]
  def change
    change_column :lists, :number, :integer
  end
end