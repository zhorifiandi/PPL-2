class CreateSkBimbingans < ActiveRecord::Migration[5.0]
  def change
    create_table :sk_bimbingans do |t|
      t.string :nomor_sk
      t.string :validitas
      t.string :nip_kaprodi
      t.string :nim_mhs

      t.timestamps :null => false, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
