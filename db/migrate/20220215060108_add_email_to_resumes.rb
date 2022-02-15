class AddEmailToResumes < ActiveRecord::Migration[7.0]
  def change
    add_column :resumes, :email, :string
  end
end
