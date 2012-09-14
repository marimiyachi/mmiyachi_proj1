class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.integer :visit_count

      t.timestamps
    end
  end
end
