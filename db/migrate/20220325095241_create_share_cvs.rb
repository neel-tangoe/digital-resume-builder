class CreateShareCvs < ActiveRecord::Migration[7.0]
  def change
    create_table :share_cvs do |t|
      t.references :resume, null: false, foreign_key: true
      t.string  "url"
      t.string  "theme"
      t.boolean "publish", :default => true

      t.timestamps
    end
  end
end
