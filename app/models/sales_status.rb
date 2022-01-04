class SalesStatus < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '新品未使用' },
    { id: 2, name: 'ほぼ未使用' },
    { id: 3, name: '目立った損傷なし' },
    { id: 4, name: 'ちょっと汚いねえ' },
    { id: 5, name: 'きちゃねえ' },
    { id: 6, name: 'えっまじ?こんなん買うん?レベル' }
  ]
  include ActiveHash::Associations
  has_many :items
end
