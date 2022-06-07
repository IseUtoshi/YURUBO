require 'rails_helper'

RSpec.describe Follow, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @another_user = FactoryBot.create(:user)
    @follow = @user.follow(@another_user.id)
  end

  describe 'フォローする' do
    context 'フォローできる場合' do
      it '正しくフォロー' do
        expect(@follow).to be_valid
      end
    end
    context 'フォローできない場合' do
      it 'フォロワーが空' do
        @follow.follower_id = ''
        @follow.valid?
        expect(@follow.errors.full_messages).to include("Follower must exist")
      end
      it 'フォロイーが空' do
        @follow.followee_id = ''
        @follow.valid?
        expect(@follow.errors.full_messages).to include("Followee must exist")
      end
      it '既にフォロー済み' do
        @follow.save
        another_follow = @user.follow(@another_user.id)
        another_follow.follower_id = @follow.follower_id
        another_follow.followee_id = @follow.followee_id
        another_follow.valid?
        expect(another_follow.errors.full_messages).to include("Follower has already been taken")
      end
      it '自身をフォロー' do
        @follow.followee_id = @follow.follower_id
        @follow.valid?
        expect(@follow.errors.full_messages).to include("フォロー対象が自分自身です")
      end
    end
  end
end
