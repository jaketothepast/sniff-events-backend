class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.references :test, null: false, foreign_key: true
      t.text :text
      t.integer :correct_choice, null: true

      t.timestamps
    end
  end
end
