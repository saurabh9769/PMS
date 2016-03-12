class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  # before_action :authenticate_user!
  has_many :user_project_ids
  has_many :projects , through: :user_project_ids

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
