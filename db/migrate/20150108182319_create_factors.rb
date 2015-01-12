class CreateFactors < ActiveRecord::Migration
  def change
    create_table :factors do |t|
      t.integer :environmental_analysis_id, :null => false
      t.string :name, :null => false
      t.text :description
      t.integer :importance, :null => false, :default => 1

      t.timestamps null: false
    end
  end
end
