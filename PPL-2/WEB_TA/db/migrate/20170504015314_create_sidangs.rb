class CreateSidangs < ActiveRecord::Migration[5.0]
  def change
    create_table :sidangs do |t|
      t.string  :nim
      t.string  :nama_mhs
      t.string  :nip_dosbing1
      t.string  :nama_dosbing1
      t.string  :nip_dosbing2
      t.string  :nama_dosbing2
      t.string  :nip_dosji1
      t.string  :nama_dosji1
      t.string  :nip_dosji2
      t.string  :nama_dosji2
      t.string  :topik
      t.string  :kategori
      t.text    :berita_acara
      t.string  :nilai_sidang1_penguji1
      t.string  :nilai_sidang2_penguji1
      t.string  :nilai_sidang3_penguji1
      t.string  :nilai_sidang4_penguji1
      t.string  :nilai_sidang5_penguji1
      t.string  :nilai_sidang6_penguji1
      t.string  :nilai_total_penguji1
      t.string  :nilai_sidang1_penguji2
      t.string  :nilai_sidang2_penguji2
      t.string  :nilai_sidang3_penguji2
      t.string  :nilai_sidang4_penguji2
      t.string  :nilai_sidang5_penguji2
      t.string  :nilai_sidang6_penguji2
      t.string  :nilai_total_penguji2
      t.string  :nilai_sidang1_pembimbing
      t.string  :nilai_sidang2_pembimbing
      t.string  :nilai_sidang3_pembimbing
      t.string  :nilai_sidang4_pembimbing
      t.string  :nilai_sidang5_pembimbing
      t.string  :nilai_sidang6_pembimbing
      t.string  :nilai_total_pembimbing
      t.string  :nilai_total
      t.string  :semester
      t.string  :tahun_ajaran
      t.string  :jadwal
      t.timestamps
    end
  end
end
