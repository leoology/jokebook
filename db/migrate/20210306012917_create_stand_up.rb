class CreateStandUp < ActiveRecord::Migration[6.1]
  def change
    create_table :stand_ups do |t|
      t.string :bit
      t.integer :bit_id
      t.integer :comedian_id

      t.timestamps
    end
  end
end
