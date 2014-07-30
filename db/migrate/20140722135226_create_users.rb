class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.bigint :phone
      t.text    :address
      t.string :state
      t.string  :dist
      t.string  :citytown
      t.string  :mandal
      t.timestamps
    end
  end
end
