class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :note
      t.integer :list_id

      t.timestamps
    end
  end
end
