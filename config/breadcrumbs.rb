# Root crumb
crumb :root do
  link "メルカリ", root_path 
end

# Regular crumb
crumb :mypage do
  link "マイページ", "/mypage/#{current_user.id}"
  parent :root
end

crumb :profile do
  link "プロフィール", profile_index_path
  parent :mypage
end

# Parent crumbs
crumb :cards do 
  link "支払い方法", cards_path
  parent :mypage
end

# Child
crumb :new_card do 
  link "クレジットカード情報入力", new_card_path
  parent :cards
end

# Recursive parent categories
crumb :exhibition do |item|
  link "商品出品画面", edit_exhibition_path(item)
  parent :mypage
end

crumb :confirm do
  link "本人情報登録", confirm_index_path
  parent :mypage
end