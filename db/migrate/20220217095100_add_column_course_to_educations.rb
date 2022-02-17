class AddColumnCourseToEducations < ActiveRecord::Migration[7.0]
  def change
    add_column :educations, :course, :string
  end
end
