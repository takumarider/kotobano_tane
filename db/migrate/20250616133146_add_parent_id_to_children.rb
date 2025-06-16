class AddParentIdToChildren < ActiveRecord::Migration[8.0]
  def change
    add_reference :children, :parent, null: false, foreign_key: true
  end
end
