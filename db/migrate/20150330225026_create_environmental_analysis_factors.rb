class CreateEnvironmentalAnalysisFactors < ActiveRecord::Migration
  def change
    create_table :environmental_analysis_factors do |t|
      t.integer :environmental_analysis_id, :null => false
      t.integer :factor_id, :null => false
      t.text :description, :default => ''
      t.decimal :grade, :precision => 3, :scale => 1, :default => 0
      t.integer :importance, :null => false, :default => 5

      t.timestamps null: false
    end
  end
end
