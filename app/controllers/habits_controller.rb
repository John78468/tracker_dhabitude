class HabitsController < ApplicationController
  def index
    @habits = Habit.all
  end

  def new
    @habit = Habit.new
  end

  def create
    @habit = Habit.create(habit_params)
    if @habit.save
      redirect_to habits_path, notice: 'habitude ajoutée'
    else
      render :new
    end
  end

  def toggle_check
    @habit = Habit.find(params[:id])
    today = Date.today
    check = @habit.habit_checks.find_by(date: today)

    if check
      check.destroy
    else
      @habit.habit_checks.create(date: today)
    end

    redirect_to habits_path
  end


  private
  def habit_params
    params.require(:habit).permit(:name)
  end
end
