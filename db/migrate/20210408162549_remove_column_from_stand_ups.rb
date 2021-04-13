class RemoveColumnFromStandUps < ActiveRecord::Migration[6.1]
  def change
    remove_column :stand_ups, :bit_id, :string
  end
end
