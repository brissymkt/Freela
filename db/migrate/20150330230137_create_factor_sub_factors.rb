class CreateFactorSubFactors < ActiveRecord::Migration
  def change
    create_table :factor_sub_factors do |t|
      t.integer :factor_id, :null => false
      t.integer :sub_factor_id, :null => false
      t.text :description, :default => ''
      t.integer :situation, :null => false, :default => 5
      t.integer :importance, :null => false, :default => 5
      t.decimal :grade, :null => false, :default => 0, :precision => 3, :scale => 1

      t.timestamps null: false
    end
  end
end
