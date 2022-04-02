class CreateStages < ActiveRecord::Migration[6.1]
  def change
    create_table :stages do |t|
      t.string :name
      t.references :project, index: true, foreign_key: true, null: false
      t.timestamps
    end
  end
end
