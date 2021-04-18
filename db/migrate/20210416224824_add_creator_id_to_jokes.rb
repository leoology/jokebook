class AddCreatorIdToJokes < ActiveRecord::Migration[6.1]
  def change
    add_column :jokes, :creator_id, :integer
  end
end
