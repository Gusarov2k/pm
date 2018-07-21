class User < ActiveRecord::Base
  has_many :tasks, foreign_key: 'user_id'
  has_many :tasks, foreign_key: 'project_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
