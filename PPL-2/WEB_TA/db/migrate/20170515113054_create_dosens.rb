class CreateDosens < ActiveRecord::Migration[5.0]
  def change
    create_table :dosens do |t|
      t.string :nama
      t.string :nip
      t.string :dosenta
      t.string :dosenpembimbing
      t.string :dosenpenguji

      t.timestamps
    end
  end
end
