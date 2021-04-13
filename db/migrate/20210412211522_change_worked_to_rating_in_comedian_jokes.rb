class ChangeWorkedToRatingInComedianJokes < ActiveRecord::Migration[6.1]
  def change
    add_column :comedian_jokes, :rating, :integer
    remove_column :comedian_jokes, :worked
  end
end
