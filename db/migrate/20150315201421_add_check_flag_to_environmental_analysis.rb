class AddCheckFlagToEnvironmentalAnalysis < ActiveRecord::Migration
  def change
    add_column :environmental_analyses, :needs_to_be_updated, :boolean, :default => false
  end
end
