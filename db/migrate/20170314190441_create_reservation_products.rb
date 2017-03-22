class CreateReservationProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :reservation_products do |t|
      t.belongs_to :reservation, index: true
      t.belongs_to :product, index: true

      t.timestamps
    end
  end
end
