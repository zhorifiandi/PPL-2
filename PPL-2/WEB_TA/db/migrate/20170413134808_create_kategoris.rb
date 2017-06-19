class CreateKategoris < ActiveRecord::Migration[5.0]
  def change
    create_table :kategoris do |t|

      t.string :kode
      t.string :nama
      t.timestamps :null => false, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
