class ChangeJobFromToJobs < ActiveRecord::Migration[7.0]
  def change
    remove_column :jobs, :date_from, :string
    add_column :jobs, :date_from, :date
  end
end
