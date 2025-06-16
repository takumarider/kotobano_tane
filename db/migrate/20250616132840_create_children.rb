class CreateChildren < ActiveRecord::Migration[8.0]
  def change
    create_table :children do |t|
      t.string :name
      t.date :birthday
      t.integer :age

      t.timestamps
    end
  end
end
