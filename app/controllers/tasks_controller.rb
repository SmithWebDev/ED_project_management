class TasksController < ApplicationController
  before_action :set_project

  def create
    @task = @project.tasks.create(task_params)

    if @project.save
      flash[:success] = 'Project successfully created'
      redirect_to @project
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  def destroy
    @task = @project.tasks.find(params[:id])
    if @task.destroy
      flash[:success] = "Task was deleted."
    else
      flash[:error] = "Task was not deleted."
    end
    redirect_to @project
  end
  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def task_params
    params[:task].permit(:content)
  end
end
