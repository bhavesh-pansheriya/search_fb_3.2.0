class RenameColumnToUserAccepted < ActiveRecord::Migration
  def change
  rename_column :user_accepteds, :type, :found_type
  end  
end
