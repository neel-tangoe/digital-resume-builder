class ChangeJobToToJobs < ActiveRecord::Migration[7.0]
  def change
    remove_column :jobs, :date_to, :string
    add_column :jobs, :date_to, :date
  end
end
