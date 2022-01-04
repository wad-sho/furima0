class CreateFurimaTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :furima_tag_relations do |t|
      t.references :item, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
