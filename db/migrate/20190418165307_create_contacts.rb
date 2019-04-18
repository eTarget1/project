class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :fullname
      t.integer :phone 
      t.string :email
      t.text :message
    end
  end
end
