class AddCategoryToJokes < ActiveRecord::Migration[6.1]
  def change
    add_column :jokes, :category, :string
  end
end
