class AddUidToComedians < ActiveRecord::Migration[6.1]
  def change
    add_column :comedians, :uid, :string
  end
end
