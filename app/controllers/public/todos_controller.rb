class Public::TodosController < ApplicationController
  def new
    @todo = Todo.new
  end

  def create
  end

  def index
  end

  def show
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
