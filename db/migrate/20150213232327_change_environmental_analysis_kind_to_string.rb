class ChangeEnvironmentalAnalysisKindToString < ActiveRecord::Migration
  def change
  	change_column :environmental_analyses, :type_of_analysis, :string
  end
end
