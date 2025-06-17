class AddNameToParents < ActiveRecord::Migration[8.0]
  def change
    add_column :parents, :name, :string
  end
end
