class UserAccepted < ActiveRecord::Base
  belongs_to :user
  attr_accessible :founded_id, :from_name, :name, :found_type, :created_time, :updated_time
end
