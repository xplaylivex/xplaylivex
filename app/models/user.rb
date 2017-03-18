class User < ActiveRecord::Base
	paginates_per 50

  ADMIN_TYPE    = 1
  CLASSIC_TYPE  = 2

  belongs_to :image

  validates :username, presence: true, length: { in: 4..128 }, uniqueness: true, format: /\A[a-zA-Z0-9\_]+\z/
  validates :email, presence: true, uniqueness: true, format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :description, length: { maximum: 2048 }, allow_nil: true
  validates :favorite_game, length: { maximum: 255 }, allow_nil: true
  validates :favorite_type, length: { maximum: 255 }, allow_nil: true
  validates :birthday, format: /\A\d{4}-\d{2}-\d{2}\z/, allow_nil: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
