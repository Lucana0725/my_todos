class Public::TodosController < ApplicationController
  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.user_id = current_user.id
    @todo.save
    redirect_to todos_path
  end

  def index
    @todos = Todo.all
    @user = current_user
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private
  
  def todo_params
    params.require(:todo).permit(:title, :body, :is_done, :importance)
  end

end
