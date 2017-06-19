class CreateNilaiAkhir2s < ActiveRecord::Migration[5.0]
  def change
    create_table :nilai_akhir2s do |t|
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
