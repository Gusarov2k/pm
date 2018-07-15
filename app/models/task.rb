class Task < ActiveRecord::Base
  belongs_to :assignee
  belongs_to :project
end
