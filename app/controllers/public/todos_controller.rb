class Public::TodosController < ApplicationController
  before_action :move_to_user_signin

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
    @todo = Todo.find(params[:id])
  end

  # def check  # public/todos/show.html.erbのチェックボックス更新用に作ったけどダメだった
  #   @todo = Todo.find(params[:id])
  #   @todo.update(todo_params)
  #   redirect_to todo_path(@todo.id)
  # end

  def update
    @todo = Todo.find(params[:id])
    @todo.update(todo_params)
    redirect_to todo_path(@todo.id)
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to todos_path
  end


  private
  
  def todo_params
    params.require(:todo).permit(:title, :body, :is_done, :importance)
  end

end
