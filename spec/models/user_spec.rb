require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(username: 'frank', fullname: 'frank okiror') }
  let(:user2) { User.new(username: 'messi', fullname: 'messi lionel') }
  let(:user3) { User.new(username: 'emma', fullname: 'emma ocom') }
  let(:follow) { Following.create(follower_id: user.id, followed_id: user3.id) }
  let(:follow2) { Following.create(follower_id: user2.id, followed_id: user3.id) }
  let(:follow3) { Following.create(follower_id: user.id, followed_id: user2.id) }

  describe 'validations' do
    it { should validate_presence_of(:fullname) }
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
  end

  describe 'associations' do
    it { should have_many(:opinions) }
    it { should have_many(:following).through(:active_relationships) }
    it { should have_many(:followers).through(:passive_relationships) }
    it { should have_many(:comments) }
    it 'has one cover image' do 
      expect(user).to respond_to(:cover_image) 
    end
    it 'has one cover image' do 
      expect(user).to respond_to(:image) 
    end
  end
  describe 'methods' do
    it 'follows a user' do
      user.follow(user3)
      expect(user.following?(user3)).to be true
    end
  end
end
