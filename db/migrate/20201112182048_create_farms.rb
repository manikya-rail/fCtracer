class CreateFarms < ActiveRecord::Migration[6.0]
  def change
    create_table :farms do |t|
      t.string :name, null: false
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
