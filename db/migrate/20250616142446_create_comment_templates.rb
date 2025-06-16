class CreateCommentTemplates < ActiveRecord::Migration[8.0]
  def change
    create_table :comment_templates do |t|
      t.references :parent, null: false, foreign_key: true
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
