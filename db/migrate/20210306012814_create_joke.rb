class CreateJoke < ActiveRecord::Migration[6.1]
  def change
    create_table :jokes do |t|
      t.string :joke

      t.timestamps
    end
  end
end
