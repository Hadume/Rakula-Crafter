#> hd.sct:block/unlock
#
# SCTの鍵を開ける
#
# @within function hd.sct:sct/tick

## 
	data remove block ~ ~ ~ Lock
## 個人ストレージを呼ぶ
	function #oh_my_dat:please
## アイテムを取得
	data modify storage hd.sct:lib ReturnItems set from block ~ ~ ~ Items
	data remove storage hd.sct:lib ReturnItems[{tag:{HdSct:1b}}]
	execute if data storage hd.sct:lib ReturnItems[] positioned ~ ~1 ~ run function hd.sct:lib/return.items/
## データを消す
	data remove storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].HdSct.Using
	data modify block ~ ~ ~ Items set value []
## プレイヤーのIDをリセット
	tag @s add HdSctThis
	execute as @a[scores={HdSct.ID=..2147483647}] if score @s HdSct.ID = @e[type=minecraft:armor_stand,tag=HdSctThis,distance=..0.001,limit=1] HdSct.ID run scoreboard players reset @s HdSct.ID
	tag @s remove HdSctThis
## スコアをリセット
	scoreboard players reset @s HdSct.Page
## Tag
	tag @s remove HdSctUsing
