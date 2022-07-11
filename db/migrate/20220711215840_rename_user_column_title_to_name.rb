class RenameUserColumnTitleToName < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :title, :name
  end
end
