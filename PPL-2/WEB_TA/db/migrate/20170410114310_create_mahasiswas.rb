class CreateMahasiswas < ActiveRecord::Migration[5.0]
  def change
    create_table :mahasiswas do |t|
      t.string :name
      t.string :nim

      t.timestamps :null => false, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
