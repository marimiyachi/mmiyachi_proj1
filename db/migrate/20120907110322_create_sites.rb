class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.integer :count

      t.timestamps
    end
  end
end
