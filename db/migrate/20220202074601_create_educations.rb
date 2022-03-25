class CreateEducations < ActiveRecord::Migration[7.0]
  def change
    create_table :educations do |t|
      t.references :resume, null: false, foreign_key: true
      t.date :date_from
      t.date :date_to
      t.string :level
      t.text :description 
      t.string :place
      t.string :course

      t.timestamps
    end
  end
end
