#> hd.rc.asset:recipes/minecraft/orange_dye_from_red_yellow
# @within tag/function hd.rc.asset:recipes

	data modify storage hd.rc: AddRecipes append value {Items:[{Slot:1b,id:"minecraft:red_dye",Count:1b},{Slot:2b,id:"minecraft:yellow_dye",Count:1b}],Result:{id:"minecraft:orange_dye",Count:2b},Options:{Anywhere:1b},Tags:["minecraft:orange_dye"]}
