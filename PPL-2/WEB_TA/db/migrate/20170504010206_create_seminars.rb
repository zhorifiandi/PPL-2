class CreateSeminars < ActiveRecord::Migration[5.0]
  def change
    create_table :seminars do |t|
      t.string  :nim
      t.string  :nama_mhs
      t.string  :nip_dosbing1
      t.string  :nama_dosbing1
      t.string  :nip_dosbing2
      t.string  :nama_dosbing2
      t.string  :nip_dosji
      t.string  :nama_dosji
      t.string  :topik
      t.string  :kategori
      t.text    :berita_acara
      t.string  :nilai_seminar1_penguji
      t.string  :nilai_seminar2_penguji
      t.string  :nilai_seminar3_penguji
      t.string  :nilai_seminar3a_penguji
      t.string  :nilai_seminar3b_penguji
      t.string  :nilai_seminar3c_penguji
      t.string  :nilai_seminar4_penguji
      t.string  :nilai_seminar4a_penguji
      t.string  :nilai_seminar4b_penguji
      t.string  :nilai_seminar4c_penguji
      t.string  :nilai_seminar4d_penguji
      t.string  :nilai_seminar4e_penguji
      t.string  :nilai_seminar5_penguji
      t.string  :nilai_seminar6_penguji
      t.string  :nilai_total_penguji
      t.string  :nilai_seminar1_pembimbing
      t.string  :nilai_seminar2_pembimbing
      t.string  :nilai_seminar3_pembimbing
      t.string  :nilai_seminar4_pembimbing
      t.string  :nilai_seminar4a_pembimbing
      t.string  :nilai_seminar4b_pembimbing
      t.string  :nilai_seminar4c_pembimbing
      t.string  :nilai_seminar5_pembimbing
      t.string  :nilai_seminar6_pembimbing
      t.string  :nilai_total_pembimbing
      t.string  :semester
      t.string  :tahun_ajaran
      t.string  :jadwal

      t.timestamps :null => false, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
