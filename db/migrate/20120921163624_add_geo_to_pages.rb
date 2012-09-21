class AddGeoToPages < ActiveRecord::Migration
  def change
    add_column :pages, :geo, :string
  end
end
