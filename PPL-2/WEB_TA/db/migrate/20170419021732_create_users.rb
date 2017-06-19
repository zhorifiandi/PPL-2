class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :role
      t.string :password_digest
      t.integer :id_on_role
      t.timestamps
    end
  end
end
