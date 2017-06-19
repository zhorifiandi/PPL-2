class CreateDosenTa < ActiveRecord::Migration[5.0]
  def change
    create_table :dosen_ta do |t|

      t.timestamps
    end
  end
end
