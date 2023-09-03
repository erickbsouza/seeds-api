class Analyse < ApplicationRecord
    belongs_to :benefited
    has_many :analysis_results

end
