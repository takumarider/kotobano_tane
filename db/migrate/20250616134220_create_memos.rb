class CreateMemos < ActiveRecord::Migration[8.0]
  def change
    create_table :memos do |t|
      t.references :child, null: false, foreign_key: true
      t.string :title
      t.text :body
      t.string :category

      t.timestamps
    end
  end
end
