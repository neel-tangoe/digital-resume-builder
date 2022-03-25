class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.references :resume, null: false, foreign_key: true
      t.string :client
      t.text :description, limit: 2000
      t.text :technologies
      t.integer :role, :default => 0, null: false
      t.string :level 
      t.integer :team_size
      t.date :date_from
      t.date :date_to

      t.timestamps
    end
  end
end
