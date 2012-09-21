class CreateGraphs < ActiveRecord::Migration
  def change
    create_table :graphs do |t|
      t.integer :page_id
      t.integer :date
      t.integer :view_count

      t.timestamps
    end
  end
end
