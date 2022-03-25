class CreateAwards < ActiveRecord::Migration[7.0]
  def change
    create_table :awards do |t|
      t.references :resume, null: false, foreign_key: true
      t.string :name, limit: 50, null: false
      t.text :description, limit: 2000

      t.timestamps
    end
  end
end
