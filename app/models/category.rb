class Category < ActiveHash::Base
    extend ActiveHash::Associations::ActiveRecordExtensions
    self.data = [
        {id: 1, name: 'メンズ'}, {id: 2, name: 'レディース'}, {id: 3, name: 'ベビー・キッズ 新着アイテム'},
        {id: 4, name: 'コスメ・香水・美容 新着アイテム'}, {id: 5, name: 'シャネル新着アイテム'}, {id: 6, name: 'ルイ ヴィトン新着アイテム'},
        {id: 7, name: 'シュプリーム新着アイテム'}, {id: 8, name: 'ナイキ新着アイテム'}
    ]
  end