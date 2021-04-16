class AddBioToComedians < ActiveRecord::Migration[6.1]
  def change
    add_column :comedians, :bio, :string
  end
end
