#> hd.sct:recipes/check/set.complete/
#
# 完成アイテムを表示させる
#
# @within function hd.sct:recipes/check/find/

## 要らない物を消す
	execute if data storage hd.sct:temp RecipesCopy[-1].Items[{_:1b}] run data remove storage hd.sct:temp RecipesCopy[-1].Items[{_:1b}]
## 完成アイテムSlotを代入
	data modify storage hd.sct:temp RecipesCopy[-1].Result.Slot set value 15b
## 完成アイテムを特殊作業台に表示させる
	data modify block ~ ~ ~ Items append from storage hd.sct:temp RecipesCopy[-1].Result
## 
	data modify storage hd.sct:temp RecipesCopy[-1].Result set from block ~ ~ ~ Items[{Slot:15b}]
## 今回使ったレシピを、コアの個人ストレージに保存する
	data modify entity @s data.Using.Recipe set from storage hd.sct:temp RecipesCopy[-1]
