class CreateUserAccepteds < ActiveRecord::Migration
  def change
    create_table :user_accepteds do |t|
      t.string :founded_id, :default => nil
      t.integer :user_id, :default => nil
      t.string :from_name, :default => nil
      t.string :name, :default => nil
      t.string :type, :default => nil
      t.string :created_time, :default => nil
      t.string :updated_time, :default => nil

      t.timestamps
    end
  end
end
