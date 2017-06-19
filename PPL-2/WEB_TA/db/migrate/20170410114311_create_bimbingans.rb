class CreateBimbingans < ActiveRecord::Migration[5.0]
  def change
    create_table :bimbingans do |t|
      t.string :dosen_pembimbing
      t.datetime :tanggal
      t.text :hasildiskusi
      t.text :rencanalanjut
      t.date :tanggalrencana
      t.string :mahasiswa
      t.text :feedback
      t.string :approved
      t.integer :ta

      t.timestamps
    end
  end
end
