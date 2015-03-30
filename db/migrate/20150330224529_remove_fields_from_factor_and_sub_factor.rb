class RemoveFieldsFromFactorAndSubFactor < ActiveRecord::Migration
  def change
  	remove_column :factors, :importance
  	remove_column :factors, :grade
  	remove_column :factors, :description
  	remove_column :factors, :environmental_analysis_id
  	remove_column :sub_factors, :description
  	remove_column :sub_factors, :importance
  	remove_column :sub_factors, :situation
  	remove_column :sub_factors, :grade
  	remove_column :sub_factors, :factor_id
  end
end
