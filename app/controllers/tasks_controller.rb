class TasksController < ApplicationController
  def index
    tasks = Task.where(start_date: Date.today.beginning_of_month..Date.today.end_of_month)
    @tasks_by_date = tasks.group_by(&:start_date)
  end
end
