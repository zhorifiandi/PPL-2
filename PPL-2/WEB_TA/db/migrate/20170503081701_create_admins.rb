class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.string :nama
      t.string :nip
      t.timestamps
    end
  end
end
