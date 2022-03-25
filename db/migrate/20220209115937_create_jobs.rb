class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.references :resume, null: false, foreign_key: true
      t.date :date_from
      t.date :date_to
      t.string :firm
      t.string :position
      t.string :place
      t.text :description

      t.timestamps
    end
  end
end
