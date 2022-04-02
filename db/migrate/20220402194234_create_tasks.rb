class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :important
      t.references :stage, index: true, foreign_key: true, null: false
      t.string :description
      t.datetime :deadline
      t.timestamps
    end
  end
end
