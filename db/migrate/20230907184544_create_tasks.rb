class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name,null: false
      t.date :start_date
      t.date :end_date
      t.text :memo,null: false

      t.timestamps 
    end
  end
end
