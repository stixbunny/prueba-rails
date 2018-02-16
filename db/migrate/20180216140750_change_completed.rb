class ChangeCompleted < ActiveRecord::Migration[5.1]
  def change
    change_column_default :todos, :description, false
  end
end
