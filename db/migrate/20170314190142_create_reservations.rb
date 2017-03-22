class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.belongs_to :user, index: true
      t.string  :status
      t.float   :total
      t.string  :name
      t.string  :address
      t.date    :date
      t.string  :time
      t.string  :phone
      t.string  :checkbox

      t.timestamps
    end
  end
end
