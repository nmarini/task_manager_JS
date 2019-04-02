class CreateUsersTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :users_tasks do |t|
      t.integer :user_id
      t.integer :task_id
      t.boolean :complete, default: false
      
      t.timestamps
    end
  end
end
