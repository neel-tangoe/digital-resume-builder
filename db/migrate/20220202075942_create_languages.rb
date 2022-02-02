class CreateLanguages < ActiveRecord::Migration[7.0]
  def change
    create_table :languages do |t|
      t.integer :resume_id, null: false
      t.string :name, limit: 50, null: false

      t.timestamps
    end
  end
end
