class Publish < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '相互フォローのみ' },
    { id: 3, name: 'フォロワーのみ' },
    { id: 4, name: '全員' }
  ]

  include ActiveHash::Associations
  has_many :posts

  end