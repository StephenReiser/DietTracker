class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.string :title
      t.string :food_name, array: true, default: []
      t.boolean :sick
      t.string :sick_type
      t.string :comments

      t.timestamps
    end
  end
end
