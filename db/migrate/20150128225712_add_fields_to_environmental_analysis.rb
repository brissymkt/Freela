class AddFieldsToEnvironmentalAnalysis < ActiveRecord::Migration
  def change
    add_column :environmental_analyses, :type, :integer, :default => 'monthly'
  end
end
