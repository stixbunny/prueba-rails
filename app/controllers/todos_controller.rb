class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    todo = Todo.new(todo_params)
    if todo.description == ""
      redirect_to todos_new_path, notice: 'No puede tener un nombre en blanco'
      return
    end
    if todo.save
      # Por convencion REST, al decir que redirija a post lleva a su SHOW
      redirect_to root_path, notice: 'Se creo con exito :)'
    else
      redirect_to todos_new_path, notice: 'No se creo po :('
    end
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      redirect_to root_path, notice: 'Se actualizo con exito'
    else
      redirect_to edit_todo(@todo.id), notice: 'No se pudo actualizar'
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to root_path, notice: 'El ToDo se ha eliminado con exito'
  end

  def complete
    @todo = Todo.find(params[:id])
    @todo.completed = true
    @todo.save
    redirect_to root_path
  end

  def list
    @todos = Todo.all
  end

  private
  def todo_params
    params.require(:todo).permit(:description, :completed)
  end
end
