class CreateResumes < ActiveRecord::Migration[7.0]
  def change
    create_table :resumes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, limit:50, null: false
      t.string :email
      t.string :phone_number, limit: 50
      t.text :general_info 
      t.text :interests
      t.integer :gender, null: false, default: 0
      t.date :birthdate
      t.text :address, limit: 500
      t.string :country, limit: 50
      t.string :website, limit: 50

      t.timestamps
    end
  end
end

