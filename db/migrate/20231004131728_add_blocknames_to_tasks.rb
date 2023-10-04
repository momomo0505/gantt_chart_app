class AddBlocknamesToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :blockname2, :string
    add_column :tasks, :blockname3, :string
  end
end
