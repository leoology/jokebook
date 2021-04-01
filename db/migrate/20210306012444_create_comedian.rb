class CreateComedian < ActiveRecord::Migration[6.1]
  def change
    create_table :comedians do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :age
      t.string :gender

      t.timestamps
    end
  end
end
