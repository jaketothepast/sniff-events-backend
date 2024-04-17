class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.references :student, null: false, foreign_key: true
      t.references :assignment, null: false, foreign_key: true
      t.string :event

      t.timestamps
    end
  end
end
