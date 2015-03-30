class RemoveGradeFromFactorSubFactor < ActiveRecord::Migration
  def change
    remove_column :factor_sub_factors, :grade
  end
end
