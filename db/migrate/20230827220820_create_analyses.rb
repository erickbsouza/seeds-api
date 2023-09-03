class CreateAnalyses < ActiveRecord::Migration[7.0]
  def change
    create_table :analyses do |t|
      t.string :responsible
      t.date :date_analyse
      t.string :comments

      t.timestamps
    end
  end
end
