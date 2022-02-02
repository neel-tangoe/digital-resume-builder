class CreateSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :skills do |t|
      t.integer :resume_id, null: false
      t.string :section
      t.string :title
      t.integer :percent

      t.timestamps
    end
  end
end
