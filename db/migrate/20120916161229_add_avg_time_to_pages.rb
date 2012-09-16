class AddAvgTimeToPages < ActiveRecord::Migration
  def change
    add_column :pages, :avg_time, :integer
  end
end
