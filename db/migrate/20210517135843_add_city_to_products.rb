class AddCityToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :city, :string
    change_column :products, :description, :text
  end
end
