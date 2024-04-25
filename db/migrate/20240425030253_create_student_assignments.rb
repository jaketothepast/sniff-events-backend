class CreateStudentAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :student_assignments do |t|
      t.belongs_to :student, null: false, foreign_key: true
      t.references :assignment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
