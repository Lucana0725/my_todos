class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|

      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :body
      t.boolean :is_done, null: false, default: false
      t.integer :importance, null: false
      t.timestamps
    end
  end
end
