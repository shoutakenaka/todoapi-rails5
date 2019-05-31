class TasksController < ApplicationController
  before_action :authorize

  def index
    tasks = user.tasks
    render json: {
      tasks: tasks.map { |o| { id: o.id, title: o.title, priority: o.priority } }
    }
  end
  
  def show
    render json: user.tasks.find(params[:id]).to_json(except: [:until, :created_at, :updated_at])
  end
  
  def create
    render json: user.tasks.create!({
      title: params[:title],
      description: params[:description],
      priority: params[:priority]
    }).to_json(except: [:until, :created_at, :updated_at])
  end
  
  def update
    task = user.tasks.find(params[:id])
    render json: task.update!({
      title: params[:title],
      description: params[:description],
      priority: params[:priority]
    }).to_json(except: [:until, :created_at, :updated_at])
  end
  
  def destroy
    task = user.tasks.find(params[:id])
    task.destroy!
    render json: {}
  end

  private

  def authorize
    token = request.headers[:AUTHORIZATION]
    current_session = Session.find_by(token: token)
    @user = current_session&.user
    if @user.blank?
      return render json: { code: 'invalid_token' }, status: 403
    end
  end

  def user
    @user
  end
end
