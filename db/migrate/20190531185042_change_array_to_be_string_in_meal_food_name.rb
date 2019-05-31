class ChangeArrayToBeStringInMealFoodName < ActiveRecord::Migration[5.2]
  def change
    change_column :meals, :food_name, :string
  end
end
