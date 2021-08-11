class AddLabelToCherry < ActiveRecord::Migration[6.0]
  def change
    add_column :cherries, :label, :string
  end
end
