class RemoveStudentAndAssignmentFromEvents < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :student_id
    remove_column :events, :assignment_id
    change_table :events do |t|
      t.references :student_assignment, null: false, foreign_key: true
    end
  end
end
