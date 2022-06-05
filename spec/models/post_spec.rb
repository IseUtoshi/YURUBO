require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '予定新規投稿' do
    context '投稿できる場合' do
      it '必須項目が正しく入力されている' do
        expect(@post).to be_valid
      end
    end
    context '新規登録できない場合' do
      it '開始時刻が空では登録できない' do
        @post.start_time = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Start time can't be blank")
      end
      it '終了時刻が空では登録できない' do
        @post.email = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("End time can't be blank")
      end
      it 'チャット設定が空では登録できない' do
        @post.chat_id = '1'
        @post.valid?
        expect(@post.errors.full_messages).to include("Chat id can't be blank")
      end
      it '公開設定が空では登録できない' do
        @post.publish_id = '1'
        @post.valid?
        expect(@post.errors.full_messages).to include("Publish id can't be blank")
      end
      it 'ユーザーが紐付いていない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('User must exist')
      end
    end
  end
end
