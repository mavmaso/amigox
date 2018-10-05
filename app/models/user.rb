class User < ApplicationRecord
  has_many :user_groups, dependent: :destroy
  has_many :groups, through: :user_groups
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
