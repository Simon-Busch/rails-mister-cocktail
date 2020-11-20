class AddImgurlToCocktails < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :img_url, :string
  end
end
