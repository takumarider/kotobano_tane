class ChangeCategoryToCategoryIdInMemos < ActiveRecord::Migration[8.0]
  def change
    remove_column :memos, :category, :string
    add_reference :memos, :category, null: false, foreign_key: true
  end
end
