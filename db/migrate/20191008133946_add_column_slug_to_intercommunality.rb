class AddColumnSlugToIntercommunality < ActiveRecord::Migration[5.0]
  def change
    add_column :intercommunalities, :slug, :string
    add_index :intercommunalities, :slug, unique: true
  end
end
