class AddStatusToAssessments < ActiveRecord::Migration[5.0]
  def change
    add_column :assessments, :status, :string
  end
end
