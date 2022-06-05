require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.create(:post)
  end

  describe '予定新規投稿' do
    context '投稿できる場合' do
      it '必須項目が正しく入力されている' do
        expect(@post).to be_valid
      end
    end
    context '新規投稿できない場合' do
      it '開始時刻が空では投稿できない' do
        @post.start_time = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Start time can't be blank")
      end
      it '終了時刻が空では投稿できない' do
        @post.end_time = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("End time can't be blank")
      end
      it 'チャット設定が空では投稿できない' do
        @post.chat_id = '1'
        @post.valid?
        expect(@post.errors.full_messages).to include("Chat can't be blank")
      end
      it '公開設定が空では投稿できない' do
        @post.publish_id = '1'
        @post.valid?
        expect(@post.errors.full_messages).to include("Publish can't be blank")
      end
      it 'ユーザーが紐付いていない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('User must exist')
      end
      it '終了時刻が開始時刻の前' do
        @post.end_time = Time.parse("#{@post.start_time}") - (60*60*6)
        @post.valid?
        expect(@post.errors.full_messages).to include("終了時刻が開始時刻の前か同じです")
      end
      it '終了時刻が開始時刻と同じ' do
        @post.end_time = @post.start_time
        @post.valid?
        expect(@post.errors.full_messages).to include("終了時刻が開始時刻の前か同じです")
      end
      it '開始時刻が現在より前' do
        @post.start_time = Time.now - (60*60)
        @post.valid?
        expect(@post.errors.full_messages).to include("開始時刻が現在より前です")
      end
      it '終了時刻が開始翌日の12時以降' do
        @post.end_time = @post.end_time = Time.parse("#{@post.start_time}") + (60*60*36)
        @post.valid?
        expect(@post.errors.full_messages).to include("終了時刻が指示範囲外です")
      end
      it '時刻が同ユーザーの中で重複している' do
        another_post = FactoryBot.create(:post)
        another_post.user_id = @post.user_id
        another_post.start_time = Time.parse("#{@post.start_time}") - (60*60)
        another_post.end_time = Time.parse("#{@post.end_time}") + (60*60)
        another_post.valid?
        expect(another_post.errors.full_messages).to include("期間が重複しています")
      end
    end
  end
end
