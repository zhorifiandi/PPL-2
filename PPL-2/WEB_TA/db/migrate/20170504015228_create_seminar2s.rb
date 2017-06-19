class CreateSeminar2s < ActiveRecord::Migration[5.0]
  def change
    create_table :seminar2s do |t|
      t.string  :nim
      t.string  :nama_mhs
      t.string  :nip_dosbing1
      t.string  :nama_dosbing1
      t.string  :nip_dosbing2
      t.string  :nama_dosbing2
      t.string  :topik
      t.string  :kategori
      t.text    :berita_acara
      t.string  :nilai_seminar_ta21_pembimbing
      t.string  :nilai_seminar_ta22_pembimbing
      t.string  :nilai_seminar_ta23_pembimbing
      t.string  :nilai_seminar_ta24_pembimbing
      t.string  :nilai_seminar_ta25_pembimbing
      t.string  :nilai_seminar_ta26_pembimbing
      t.string  :nilai_seminar_ta27_pembimbing
      t.string  :nilai_total_pembimbing
      t.string  :semester
      t.string  :tahun_ajaran
      t.string  :jadwal

      t.timestamps :null => false, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
