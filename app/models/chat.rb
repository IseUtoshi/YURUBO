class Chat < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'ボイスチャット' },
    { id: 3, name: 'テキストチャット' },
    { id: 4, name: '使用しない' }
  ]

  include ActiveHash::Associations
  has_many :posts

  end