class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :item, foreign_key: true
      t.references :wada, foreign_key: true
      t.timestamps
    end
  end
end