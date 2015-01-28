class RenameEnvironmentalAnalysisColumn < ActiveRecord::Migration
  def change
  	rename_column :environmental_analyses, :type, :type_of_analysis
  end
end
