class CreateAnalyses < ActiveRecord::Migration
  def change
    create_table :analyses do |t|
      t.integer :user_id, :null => false
      t.date :date_and_month, :default => Date.today
      t.decimal :grade, :precision => 5, :decimal => 2

      t.timestamps null: false
    end
  end
end
