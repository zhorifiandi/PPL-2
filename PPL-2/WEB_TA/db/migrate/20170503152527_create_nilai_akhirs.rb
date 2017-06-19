class CreateNilaiAkhirs < ActiveRecord::Migration[5.0]
  def change
    create_table :nilai_akhirs do |t|
      t.string :nim
      t.integer :nilai_tugas
      t.integer :nilai_akhir
      t.integer :jumlah_presensi
      t.string  :semester
      t.string  :tahun_ajaran
      t.timestamps
    end
  end
end
