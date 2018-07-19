class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tasks

  validates :name, length: {in: 4..30}
  validates :user, presence: true

  accepts_nested_attributes_for :tasks, allow_destroy: true

end
