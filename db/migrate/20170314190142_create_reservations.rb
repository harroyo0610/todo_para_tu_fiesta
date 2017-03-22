class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.belongs_to :user, index: true
<<<<<<< HEAD
      t.string  :status
=======
<<<<<<< HEAD
      t.string  :status
=======
>>>>>>> e67bc5bf1f2bc2c7dbdfa817d49d58142e5695c5
>>>>>>> 495f2788fb267e939f5fb2641300fa8212758ffc
      t.float   :total
      t.string  :name
      t.string  :address
      t.date    :date
      t.string  :time
      t.string  :phone
<<<<<<< HEAD
      t.string  :checkbox
=======
<<<<<<< HEAD
      t.string  :checkbox
=======
>>>>>>> e67bc5bf1f2bc2c7dbdfa817d49d58142e5695c5

>>>>>>> 495f2788fb267e939f5fb2641300fa8212758ffc
      t.timestamps
    end
  end
end
