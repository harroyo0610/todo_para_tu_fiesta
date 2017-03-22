class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.belongs_to :user, index: true
<<<<<<< HEAD
      t.string  :status
=======
>>>>>>> e67bc5bf1f2bc2c7dbdfa817d49d58142e5695c5
      t.float   :total
      t.string  :name
      t.string  :address
      t.date    :date
      t.string  :time
      t.string  :phone
<<<<<<< HEAD
      t.string  :checkbox
=======
>>>>>>> e67bc5bf1f2bc2c7dbdfa817d49d58142e5695c5

      t.timestamps
    end
  end
end
