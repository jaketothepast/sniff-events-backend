class CreateTestMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :test_memberships do |t|
      t.belongs_to :test_taker, null: false, foreign_key: true
      t.belongs_to :test, null: false, foreign_key: true
      t.datetime :last_access
      t.datetime :completed_at

      t.timestamps
    end
  end
end
