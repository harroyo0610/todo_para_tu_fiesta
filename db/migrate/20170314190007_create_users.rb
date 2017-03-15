class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string   :name
      t.string   :email
      t.string   :password
      t.string   :password_digest
      t.string   :remember_digest
      t.boolean  :activation_digest, defaul: false
      t.datetime :activated_at
      t.timestamps
  	end
  end
end
