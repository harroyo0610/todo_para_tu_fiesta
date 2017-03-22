class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.float :amount
      t.string :unit_type

      t.timestamps
    end
  end
end
