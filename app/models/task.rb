class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  validate_presence_of :name, :description
end
