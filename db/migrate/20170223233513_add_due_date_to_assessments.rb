class AddDueDateToAssessments < ActiveRecord::Migration[5.0]
  def change
    add_column :assessments, :due_date, :datetime
  end
end
