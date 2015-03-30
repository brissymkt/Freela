class AddEnvironmentalAnalysisToFactorSubFactor < ActiveRecord::Migration
  def change
    add_column :factor_sub_factors, :environmental_analysis_id, :integer, :null => false
  end
end
