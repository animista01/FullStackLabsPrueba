class User < ActiveRecord::Base

  VALID_EMAIL_REGEX = /[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9\-.]/
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, if: :email
  validates :password, length: { minimum: 6, maximum: 20 }, if: :password
  
  has_many :tickets
  has_one :role
  belongs_to :role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
