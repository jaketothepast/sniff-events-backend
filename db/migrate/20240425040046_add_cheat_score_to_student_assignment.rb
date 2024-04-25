class AddCheatScoreToStudentAssignment < ActiveRecord::Migration[7.0]
  def change
    change_table :student_assignments do |t|
      t.integer :cheat_score
    end
  end
end
