class CreateSeminarsidangs < ActiveRecord::Migration[5.0]
  def change
    create_table :seminarsidangs do |t|
      t.string :nim
      t.boolean :seminarta1
      t.boolean :seminarta2
      t.boolean :sidangta2
      t.boolean :laporan_ta
      t.boolean :abstrak_ta
      t.boolean :makalah
      t.boolean :poster
      t.boolean :program
      t.timestamps
    end
  end
end
