#检测datapackets-functions-LIB数据包是否加载

#如果未加载：
function dfl:dfl_enable
execute unless score @r dfl_enable matches 1 as @a unless score @s dfl_need matches 1 run tellraw @s [{"type":"translatable","translate":"need.dfl.white.elephant.no","fallback":"缺少前置","color":"red","bold":true},{"text":" !","color":"red","bold":true}]
execute unless score @r dfl_enable matches 1 as @a unless score @s dfl_need matches 1 run tellraw @s [{"type":"translatable","translate":"need.dfl.white.elephant.please.install","fallback":"请安装数据包: ","color":"gray"},{"text":"datapackets functions LIB","color":"blue","underlined":true,"italic":true,"click_event":{"action":"open_url","url":"https://modrinth.com/datapack/datapackets-functions-lib"},"clickEvent":{"action":"open_url","value":"https://modrinth.com/datapack/datapackets-functions-lib"}}]
execute unless score @r dfl_enable matches 1 as @a unless score @s dfl_need matches 1 at @s run playsound entity.item.break player @s
execute unless score @r dfl_enable matches 1 as @a unless score @s dfl_need matches 1 at @s run playsound entity.villager.no player @s
execute unless score @r dfl_enable matches 1 as @a unless score @s dfl_need matches 1 run scoreboard players set @s dfl_need 1
execute unless score @r dfl_enable matches 1 run return fail

execute at @a if dimension minecraft:the_nether run function dfl:tick/change_block {old:"lava",new:"water",num:"5"}
execute at @a if dimension minecraft:overworld run function dfl:tick/change_block {old:"water",new:"lava",num:"5"}
execute at @a if dimension minecraft:overworld run function dfl:tick/change_block {old:"obsidian",new:"lava",num:"5"}
execute at @a if dimension minecraft:the_nether run function dfl:tick/change_block {old:"obsidian",new:"water",num:"5"}
execute at @e[type=item,nbt={Item:{id:"minecraft:lava_bucket"}}] run setblock ~ ~ ~ nether_portal
