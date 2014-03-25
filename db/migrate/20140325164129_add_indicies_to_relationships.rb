class AddIndiciesToRelationships < ActiveRecord::Migration
  add_index :relationships, :follower_id
  add_index :relationships, :followed_id
  add_index :relationships, [:follower_id, :followed_id], unique: true
end
