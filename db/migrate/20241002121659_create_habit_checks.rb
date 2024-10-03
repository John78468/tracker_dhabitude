class CreateHabitChecks < ActiveRecord::Migration[7.0]
  def change
    create_table :habit_checks do |t|
      t.references :habit, null: false, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
