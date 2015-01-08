class AddGradeToFactor < ActiveRecord::Migration
  def change
    add_column :factors, :grade, :decimal, :precision => 5, :decimal => 2, :default => 1
  end
end
