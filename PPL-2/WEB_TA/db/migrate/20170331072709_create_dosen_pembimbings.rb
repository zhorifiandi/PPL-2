class CreateDosenPembimbings < ActiveRecord::Migration[5.0]
  def change
    create_table :dosen_pembimbings do |t|

      t.timestamps :null => false, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
