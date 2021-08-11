class CreateCherries < ActiveRecord::Migration[6.0]
  def change
    create_table :cherries do |t|
      t.string :location
      t.string :variety
      t.integer :year_planted
      t.integer :water
      t.float :carbon_improvement
      t.string :bees

      t.timestamps
    end
  end
end
