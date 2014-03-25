require 'spec_helper'

describe User do
  let(:user) { User.create(name: "User", email: "user@email.com") }
  let(:other_user) { User.create(name: "Another User", email: "another@email.com")}

  describe '#follow!' do
    before do
      user.follow!(other_user)
    end

    it "will add other_user to followed_users" do
      expect(user.followed_users).to include(other_user)
    end
  end

  describe '#unfollow!' do
    before do
      user.follow!(other_user)
      user.unfollow!(other_user)
    end

    it "will remove other_user from followed_users" do
      expect(user.followed_users).not_to include(other_user)
    end
  end

  describe '#following?' do
    context "when a user is following other_user" do
      before do
        user.follow!(other_user)
      end

      it "should return true" do
        expect(user.following?(other_user)).to be_true
      end
    end

    context "when a user is not following_other_user" do
      it "should return false" do
        expect(user.following?(other_user)).to be_false
      end
    end
  end
end
