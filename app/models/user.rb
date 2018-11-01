class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include SearchUser

  validates :name ,uniqueness: true
  validates :name ,length: {maximum: 36}
  validates :name ,presence: true
  validates :description , length: {maximum: 140}

  #　画像投稿

  attachment :user_image
  attachment :header_image

  #アソシエーション
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :wannagos, dependent: :destroy
  has_many :trips, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  def email_required?
    false
  end
  def email_changed?
    false
  end
  def following?(other_user)
    # relationships.find_by(followed_id: other_user.id)
    followed_users.include?(other_user)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).really_destroy!
  end
end
