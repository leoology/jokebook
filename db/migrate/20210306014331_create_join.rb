class CreateJoin < ActiveRecord::Migration[6.1]
  def change
    create_table :comedian_joke do |t|
      t.integer :comedian_id
      t.integer :joke_id

      t.timestamps
    end
  end
end
