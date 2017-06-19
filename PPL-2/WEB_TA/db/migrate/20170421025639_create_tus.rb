class CreateTus < ActiveRecord::Migration[5.0]
  def change
    create_table :tus do |t|
      t.string :nama
      t.string :nip
      t.timestamps
    end
  end
end
