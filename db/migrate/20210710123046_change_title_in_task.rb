class ChangeTitleInTask < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :title, :string, unique: true
  end
end
