class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
	  t.string :nim
      t.string :nip1
      t.string :nip2
      t.string :judul_topik
      t.string :kategori_topik
      t.string :nomor_sk
      t.timestamps
    end
  end
end
