class TasksController < ApplicationController
  def index
    @view = params[:view] || 'week'
    @start_date = params[:start_date] ? Date.parse(params[:start_date]).beginning_of_month : Date.today.beginning_of_month
    @end_date = (@start_date + 1.month).end_of_month # 次の月の最終日
    @tasks = Task.where("start_date <= ? AND end_date >= ?", @end_date, @start_date)
    
    @tasks_by_date = Hash.new { |hash, key| hash[key] = [] }
  
    @tasks.each do |task|
      (task.start_date..task.end_date).each do |date|
        @tasks_by_date[date] << task if date >= @start_date && date <= @end_date
      end
    end
  end

    def new
      @task = Task.new
    end

    def create
      @task = Task.new(task_params)
      if @task.save
        redirect_to root_path
      else
        render :new
      end
    end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  def previous_month
    date = params[:start_date] ? Date.parse(params[:start_date]).beginning_of_month : Date.today.beginning_of_month
    redirect_to tasks_path(start_date: date.prev_month.beginning_of_month)
  end
  
  def next_month
    date = params[:start_date] ? Date.parse(params[:start_date]).beginning_of_month : Date.today.beginning_of_month
    redirect_to tasks_path(start_date: date.next_month.beginning_of_month)
  end


  def edit_blockname
    @task = Task.find(params[:id])
  end
  
  def update_blockname
    @task = Task.find(params[:id])
    if @task.update(blockname_params)
      redirect_to root_path
    else
      render :edit_blockname
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :start_date, :end_date, :memo)
  end

  def blockname_params
    params.require(:task).permit(:blockname)
  end

end