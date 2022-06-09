require 'rails_helper'

RSpec.describe Game, type: :model do
  before do
    @game = FactoryBot.create(:game)
  end

  describe 'ゲームタイトル新規登録' do
    context '登録できる場合' do
      it '必須項目が正しく入力されている' do
        expect(@game).to be_valid
      end
    end
    context '登録できない場合' do
      it 'タイトルが空では登録できない' do
        @game.title = ''
        @game.valid?
        expect(@game.errors.full_messages).to include("Title can't be blank")
      end
      it 'ユーザーが紐付いていない' do
        @game.user = nil
        @game.valid?
        expect(@game.errors.full_messages).to include('User must exist')
      end
      it '既に自分が登録したタイトルを投稿' do
        another_game = FactoryBot.create(:game)
        another_game.user = @game.user
        another_game.title = @game.title
        another_game.valid?
        expect(another_game.errors.full_messages).to include('Title has already been taken')
      end
      it '既に管理者が登録したタイトルを投稿' do
        user = FactoryBot.create(:user, id: 1)
        admin_game = FactoryBot.create(:game, user_id: user.id)
        @game.title = admin_game.title
        @game.save(context: :game_save)
        expect(@game.errors.full_messages).to include("既に登録済みのタイトルです")
      end
    end
  end
end
