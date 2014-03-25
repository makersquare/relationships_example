class User < ActiveRecord::Base
  # the join table to track followers and followed users
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  # find users the current user has followed
  has_many :followed_users, through: :relationships, source: :followed

  # look at the join table from the POV of who is following the current user
  has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship"
  # find other users who have followed the current user
  has_many :followers, through: :reverse_relationships, source: :follower

  def following?(other_user); end
  def follow!(other_user); end
  def unfollow!(other_user); end
end
