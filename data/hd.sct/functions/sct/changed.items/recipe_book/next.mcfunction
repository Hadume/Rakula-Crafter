#> hd.sct:sct/changed.items/recipe_book/next
#
# 次のページへ
#
# @within function hd.sct:sct/changed.items/recipe_book/

#> ScoreHolder
# @private
 #declare score_holder $HdSct.Success
## ページを増やす
	scoreboard players add @s HdSct.Page 1
## ページを探す
	function hd.sct:recipes/book/find/
## ページがあったら、上書き
	execute if data storage hd.sct:temp PageCopy[] run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].HdSct.Using.RecipeBook set from storage hd.sct:temp PageCopy[-1].Data
## ページが無かったら、スコアを減らす
	execute unless data storage hd.sct:temp PageCopy[] run scoreboard players remove @s HdSct.Page 1
## やっぱ、ページ作っちゃうも～～ん
	execute unless data storage hd.sct:temp PageCopy[] if data storage hd.sct:recipe_book NotYet[] store success score $HdSct.Success HdSct.Temp run function hd.sct:recipes/book/make/
	execute if score $HdSct.Success HdSct.Temp matches 1 run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].HdSct.Using.RecipeBook set from storage hd.sct:recipe_book _[-1].Data
## アイテム
	execute if data storage hd.sct:recipe_book NotYet[] run loot replace block ~ ~ ~ container.23 loot hd.sct:gui/recipe_book/next
	execute unless data storage hd.sct:recipe_book NotYet[] run loot replace block ~ ~ ~ container.23 loot hd.sct:gui/recipe_book/cant.next
## 一時使用ScoreHolder
	scoreboard players reset $HdSct.Success