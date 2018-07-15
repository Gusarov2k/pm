class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :user, index: true, foreign_key: true
      t.belongs_to :project, index: true, foreign_key: true
      t.datetime :due_date
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
