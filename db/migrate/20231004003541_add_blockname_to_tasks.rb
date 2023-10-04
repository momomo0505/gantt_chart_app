class AddBlocknameToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :blockname, :string
  end
end