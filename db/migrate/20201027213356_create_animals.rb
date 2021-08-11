class CreateAnimals < ActiveRecord::Migration[6.0]
  def change
    create_table :animals do |t|
      t.string :bovisync_id, index: true, null: false

      t.timestamps
    end
  end
end
