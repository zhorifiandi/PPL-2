class CreateAjukanTopiks < ActiveRecord::Migration[5.0]
  def change
    create_table :ajukan_topiks do |t|
	    t.string :mahasiswa
      t.string :nim
      t.string :topik
      t.string :kategori
      t.string :nip
      t.string :dosen
      t.string :prioritas_mahasiswa
      t.string :prioritas_dosen
      t.boolean :availability
      t.timestamps
    end
  end
end
