class CreateTestTakers < ActiveRecord::Migration[7.0]
  def change
    create_table :test_takers do |t|
      t.string :email, null: false, unique: true

      t.timestamps
    end
  end
end
