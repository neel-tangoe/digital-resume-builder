class CreateEducations < ActiveRecord::Migration[7.0]
  def change
    create_table :educations do |t|
      t.integer :resume_id, null: false
      t.date :date_from
      t.date :date_to
      t.string :level
      t.text :description 
      t.string :place

      t.timestamps
    end
  end
end
