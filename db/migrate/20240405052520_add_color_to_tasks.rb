class AddColorToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :color, :string
  end
end
