#> hd.sct:main/crafter/check.recipe/loop
#
# レシピを確認するための準備
#
# @within function hd.sct:main/crafter/check.recipe/prepare
# @private

## 仮アイテムを追加
	data modify storage hd.sct:temp ItemsCopy append from storage hd.sct: Blank[]
	data modify storage hd.sct:temp RecipesCopy[-1].Items append from storage hd.sct: Blank[]
## 確認
	execute if data storage hd.sct:temp RecipesCopy[-1].Options.Mirror_VERT run function hd.sct:main/crafter/check.recipe/mirror/vert/
	execute if data storage hd.sct:temp RecipesCopy[-1].Options.Mirror_HOR run function hd.sct:main/crafter/check.recipe/mirror/hor/
	execute if data storage hd.sct:temp RecipesCopy[-1].Options.Anywhere unless data storage hd.sct:temp RecipesCopy[-1].Options.Mirror_VERT unless data storage hd.sct:temp RecipesCopy[-1].Options.Mirror_HOR run function hd.sct:main/crafter/check.recipe/anywhere/
	execute unless data storage hd.sct:temp RecipesCopy[-1].Options.Anywhere unless data storage hd.sct:temp RecipesCopy[-1].Options.Mirror_VERT unless data storage hd.sct:temp RecipesCopy[-1].Options.Mirror_HOR run function hd.sct:main/crafter/check.recipe/normal.loop
## データを消す
	execute if score $HdSct.lib.Different HdSct.Temp matches 1 run data remove storage hd.sct:temp RecipesCopy[-1]
## データを戻しておく
	execute if data storage hd.sct:temp ItemsCopy[{_:1b}] run data remove storage hd.sct:temp ItemsCopy[{_:1b}]
## まだ確認するデータがあったら、ループさせる
	execute if data storage hd.sct:temp RecipesCopy[] if score $HdSct.lib.Different HdSct.Temp matches 1 run function hd.sct:main/crafter/check.recipe/loop