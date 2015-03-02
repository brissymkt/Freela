class CreateFinancialSituationPastYears < ActiveRecord::Migration
  def change
    create_table :financial_situation_past_years do |t|
      t.decimal :worst_income
      t.decimal :best_income
      t.decimal :total_income
      t.integer :environmental_analysis_id

      t.timestamps null: false
    end
  end
end
