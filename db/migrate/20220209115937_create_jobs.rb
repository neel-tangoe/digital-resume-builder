class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.integer :resume_id, null: false
      t.date :date_from
      t.date :date_to
      t.string :firm
      t.string :position
      t.string :place

      t.timestamps
    end
  end
end
