class AddColumnToIntercommunalities < ActiveRecord::Migration[5.0]
  def change
    add_column :intercommunalities, :population, :integer, default: 0
  end
end
