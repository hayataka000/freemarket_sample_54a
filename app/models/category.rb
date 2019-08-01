class Category < ActiveHash::Base
    extend ActiveHash::Associations::ActiveRecordExtensions
    self.data = [
        {id: 1, name: 'メンズ'}, {id: 2, name: 'レディース'}, {id: 3, name: 'ベビー・キッズ 新着アイテム'},
        {id: 4, name: 'コスメ・香水・美容 新着アイテム'}, {id: 5, name: '本・音楽・ゲーム'}, {id: 6, name: 'おもちゃ・ホビー・グッズ'},
        {id: 7, name: 'スポーツ・レジャー'}, {id: 8, name: 'その他'}
    ]
  end