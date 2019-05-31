class ChangeFoodNameDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:meals, :food_name, nil)
  end
end
