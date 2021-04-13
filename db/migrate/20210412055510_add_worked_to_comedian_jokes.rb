class AddWorkedToComedianJokes < ActiveRecord::Migration[6.1]
  def change
    add_column :comedian_jokes, :worked, :string
  end
end
