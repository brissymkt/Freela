class AddGradeToFactor < ActiveRecord::Migration
  def change
    add_column :factors, :grade, :decimal, :precision => 3, :scale => 1, :default => 0
  end
end
