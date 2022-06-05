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
    end
  end
end
