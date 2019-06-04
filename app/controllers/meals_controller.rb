class MealsController < ApplicationController
  
  before_action :authenticate_user
  before_action :set_meal, only: [:show, :update, :destroy]

  # GET /meals
  def index
    @meals = User.find(params['user_id']).meals
    puts "params:  #{params['user_id']}"
    puts "all params: #{params}"
    # puts "chicken: #{User.find(1).meals.where(["food_name like ? and sick = ?", "%Apples%", true])}"
    # @apples = User.find(1).meals.where(["food_name like ? and sick = ?", "%Apples%", true])
    # @apples = @meals.where(["food_name like ? and sick = ?", "%Apples%", true])


    # Seems like I need to add this whole section to create and post routes?????
    @sick = @meals.select(:food_name).where("sick": true)
    @sickCount = @sick.group(:food_name).count
    @sickString = ''
    @sick.each {|x| @sickString.concat(" " + x[:food_name])}
    @sickNoComma = @sickString.gsub(/,/, ' ').gsub(/  /, ' ')
    @stringResult = @sickNoComma.downcase.split.inject(Hash.new(0)) { |h,v| h[v] += 1; h }

    # I think it would make sense to 'clean' @sickString to make it all downcase and remove commas
    puts "apple test: #{@sick} count: #{@sickCount} string: #{@sickString}"

    # Could certainly refactor this down to only show meals and stringResult

    render json: {meals: @meals.reverse, sick: @sick, count: @sickCount, string: @sickString, stringResult: @stringResult.sort_by {|key, value| value}}
    # render json: @meals.reverse
  end

  # GET /meals/1
  def show
    render json: @meal
  end

  # POST /meals
  def create
    
    @meal = Meal.new(meal_params)
    if @meal.save
      puts "meal params: #{meal_params['user_id']}"
      @sick = User.find(meal_params['user_id']).meals.select(:food_name).where("sick": true)
      @sickString = ''
      @sick.each {|x| @sickString.concat(" " + x[:food_name])}
      @sickNoComma = @sickString.gsub(/,/, ' ').gsub(/  /, ' ')
      @stringResult = @sickNoComma.downcase.split.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
      render json: {meal: @meal, sickString: @stringResult.sort_by {|key, value| value}}, status: :created
    else
      render json: @meal.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /meals/1
  def update
    
    if @meal.update(meal_params)
      @sick = User.find(meal_params['user_id']).meals.select(:food_name).where("sick": true)
      @sickString = ''
      @sick.each {|x| @sickString.concat(" " + x[:food_name])}
      @sickNoComma = @sickString.gsub(/,/, ' ').gsub(/  /, ' ')
      @stringResult = @sickNoComma.downcase.split.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
      render json: {meal: @meal, sickString: @stringResult.sort_by {|key, value| value}}
    else
      render json: @meal.errors, status: :unprocessable_entity
    end
  end

  # DELETE /meals/1
  def destroy
    puts params
    @meal.destroy
    puts "params: #{params['user_id']}"
      @sick = User.find(params['user_id']).meals.select(:food_name).where("sick": true)
      @sickString = ''
      @sick.each {|x| @sickString.concat(" " + x[:food_name])}
      @sickNoComma = @sickString.gsub(/,/, ' ').gsub(/  /, ' ')
      @stringResult = @sickNoComma.downcase.split.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
      render json: {sickString: @stringResult.sort_by {|key, value| value}}, status: :created
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal
      @meal = Meal.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def meal_params
      params.require(:meal).permit(:title, :food_name, :sick, :sick_type, :comments, :user_id)
    end
end




# User.find(1).meals.where(["food_name like ? and sick = ?", "%Apples%", true])