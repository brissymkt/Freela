class CreateSubFactors < ActiveRecord::Migration
  def change
    create_table :sub_factors do |t|
      t.integer :factor_id, :null => false
      t.string :name, :null => false
      t.text :description, :default => ''
      t.integer :importance, :null => false, :default => 5
      t.integer :situation, :null => false, :default => 5
      t.decimal :grade, :null => false, :default => 0, :precision => 3, :scale => 1

      t.timestamps null: false
    end
  end
end
