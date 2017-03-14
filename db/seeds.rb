user = User.create(email: "humberto@gmail.com", name: "Humberto arroyo", password: "humberto", confirm_password: "humberto")
reservation = Reservation.create(user_id: user.id,total: 12566.5, name: "Armando", address: "Salamanca guanajuato", date: "2017-03-15", time: "19:00")
product1 = Product.create(name: "arrachera", amount: 2.54, unit_type: "kg")
product2 = Product.create(name: "t-bone", amount: 5.84, unit_type: "kg")
ReservationProduct.create(reservation_id: reservation.id, product_id: product1.id)
ReservationProduct.create(reservation_id: reservation.id, product_id: product2.id)