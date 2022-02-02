class CreateAwards < ActiveRecord::Migration[7.0]
  def change
    create_table :awards do |t|
      t.integer :resume_id, null: false
      t.string :name, limit: 50, null: false
      t.text :description, limit: 2000

      t.timestamps
    end
  end
end
