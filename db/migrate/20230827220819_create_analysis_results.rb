class CreateAnalysisResults < ActiveRecord::Migration[7.0]
  def change
    create_table :analysis_results do |t|
      t.integer :seeds_total
      t.integer :high_vigor
      t.integer :fungus
      t.integer :physical_damage
      t.integer :wrinkled
      t.integer :chemical_damage

      t.timestamps
    end
  end
end
