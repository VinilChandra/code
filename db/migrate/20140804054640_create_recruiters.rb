class CreateRecruiters < ActiveRecord::Migration
  def change
    create_table :recruiters do |t|
      t.string :name
      t.string :email
      t.string :companyname
      t.string :password_digest
      t.string :phone
      t.text   :companyaddr

      t.timestamps
    end
  end
end
