class AddActiveToTests < ActiveRecord::Migration[7.0]
  def change
    add_column :tests, :active, :boolean, default: false
  end
end
