class CreateFuturejobs < ActiveRecord::Migration
  def change
    create_table :futurejobs do |t|
         t.string :title
      t.string :desc
      t.string :name
      t.string :validdate
      t.timestamps
    end
  end
end
