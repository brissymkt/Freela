class CreateFactors < ActiveRecord::Migration
  def change
    create_table :factors do |t|
      t.integer :environmental_analysis_id, :null => false
      t.string :name, :null => false
      t.text :description, :default => ''
      t.integer :importance, :null => false, :default => 5

      t.timestamps null: false
    end
  end
end
