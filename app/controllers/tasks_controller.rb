class TasksController < ApplicationController
  def index
    tasks = Task.all
    render json: {
      tasks: tasks.map { |o| { id: o.id, title: o.title, priority: o.priority } }
    }
  end
  
  def show
    render json: Task.find(params[:id]).to_json(except: [:until, :created_at, :updated_at])
  end
  
  def create
    render json: Task.create!({
      title: params[:title],
      description: params[:description],
      priority: params[:priority]
    }).to_json(except: [:until, :created_at, :updated_at])
  end
  
  def update
    task = Task.find(params[:id])
    render json: task.update!({
      title: params[:title],
      description: params[:description],
      priority: params[:priority]
    }).to_json(except: [:until, :created_at, :updated_at])
  end
  
  def destroy
    task = Task.find(params[:id])
    task.destroy!
    render json: {}
  end
end
