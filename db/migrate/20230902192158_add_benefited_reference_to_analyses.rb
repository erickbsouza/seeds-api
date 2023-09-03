class AddBenefitedReferenceToAnalyses < ActiveRecord::Migration[7.0]
  def change
    add_reference :analyses, :benefited, null: false, foreign_key: true
  end
end
