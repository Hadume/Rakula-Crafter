#> hd.sct:sct/changed.items/recipe_book/tag/update
#
# Tagを更新
#
# @within function hd.sct:sct/changed.items/recipe_book/tag/
## Tagをコピー
	data modify storage hd.sct:temp TagCopy append from entity @s data.Using.RecipeBookTag.Data[]
## 仮要素を追加
	data modify storage hd.sct:temp TagCopy append from storage hd.sct: Blank[]
## アイテムを選択
	function hd.sct:sct/changed.items/recipe_book/tag/loop
## 仮要素を削除
	execute if data storage hd.sct:temp TagCopy[{_:1b}] run data remove storage hd.sct:temp TagCopy[{_:1b}]
	data modify storage hd.sct:temp TagItems[].tag.HdSct.Tag set value 1b
## Tagを返す
	data modify entity @s data.Using.RecipeBookTag.Data set from storage hd.sct:temp TagCopy
## アイテムを表示
	data modify block ~ ~ ~ Items append from storage hd.sct:temp TagItems[]
## アイテムを保存
	data remove entity @s data.Using.RecipeBook[{tag:{HdSct:{Recipe:{Selected:1b}}}}].tag.HdSct.Recipe.Items[{tag:{HdSct:{Tag:1b}}}]
	data modify entity @s data.Using.RecipeBook[{tag:{HdSct:{Recipe:{Selected:1b}}}}].tag.HdSct.Recipe.Items append from storage hd.sct:temp TagItems[]
## 次の更新タイミングを設定
	data modify entity @s data.Using.RecipeBookTag.Count set value 15
## 一時使用Storageをリセット
	data remove storage hd.sct:temp TagCopy
	data remove storage hd.sct:temp TagItems
