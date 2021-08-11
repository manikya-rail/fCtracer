class AddEarTagToAnimals < ActiveRecord::Migration[6.0]
  def change
    add_column :animals, :eartag, :string
  end
end
