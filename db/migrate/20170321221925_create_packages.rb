class CreatePackages < ActiveRecord::Migration[5.0]
  def change
    create_table :packages do |t|
      t.integer     :persons
      t.integer     :glass_person
      t.string      :size
      t.string      :meat
      t.float       :total

      t.timestamps
    end
  end
end
