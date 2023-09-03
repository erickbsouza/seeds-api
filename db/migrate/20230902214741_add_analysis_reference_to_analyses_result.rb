class AddAnalysisReferenceToAnalysesResult < ActiveRecord::Migration[7.0]
  def change
    add_reference :analysis_results, :analyse, null: false, foreign_key: true
  end
end
