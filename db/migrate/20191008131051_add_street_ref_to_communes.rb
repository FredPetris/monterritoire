class AddStreetRefToCommunes < ActiveRecord::Migration[5.0]
  def change
    add_reference :communes, :street, foreign_key: true
  end
end
