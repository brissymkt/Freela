class RemoveFieldsFromFactorAndSubFactor < ActiveRecord::Migration
  def change
  	remove_column :factors, :importance, :integer
  	remove_column :factors, :grade, :decimal
  	remove_column :factors, :description, :text
  	remove_column :factors, :environmental_analysis_id, :integer
  	remove_column :sub_factors, :description, :text
  	remove_column :sub_factors, :importance, :integer
  	remove_column :sub_factors, :situation, :integer
  	remove_column :sub_factors, :grade, :decimal
  	remove_column :sub_factors, :factor_id, :integer
  end
end
