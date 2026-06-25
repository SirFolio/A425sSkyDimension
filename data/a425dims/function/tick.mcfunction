# This function runs every tick

# Increment freeze timer
scoreboard players add #timer a425_freeze 1
execute if score #timer a425_freeze matches 60.. run scoreboard players set #timer a425_freeze 0

# Store player Y coordinate into score for players in the sky dimension
execute as @a at @s if dimension a425dims:the_sky store result score @s a425_freeze run data get entity @s Pos[1]

# Clear score for players who left the sky dimension (so they don't keep freezing)
execute as @a at @s unless dimension a425dims:the_sky run scoreboard players reset @s a425_freeze

# Fall back to Overworld if below Y=72
execute as @a at @s if dimension a425dims:the_sky if score @s a425_freeze matches ..72 in minecraft:overworld run tp @s ~ 320 ~
execute as @a[scores={a425_freeze=..72}] run effect give @s minecraft:resistance 15 4 true
execute as @a[scores={a425_freeze=..72}] run scoreboard players reset @s a425_freeze

# Y=224..239: Mild Freezing (Slowness 1, small particles)
execute as @a[scores={a425_freeze=224..239}] at @s run effect give @s minecraft:slowness 1 0 true
execute as @a[scores={a425_freeze=224..239}] at @s run particle minecraft:snowflake ~ ~1 ~ 1 1 1 0.05 5

# Y=240..255: Moderate Freezing (Slowness 2, more particles, 1 freeze damage every 3 seconds)
execute as @a[scores={a425_freeze=240..255}] at @s run effect give @s minecraft:slowness 1 1 true
execute as @a[scores={a425_freeze=240..255}] at @s run particle minecraft:snowflake ~ ~1 ~ 1 1 1 0.05 10
execute as @a[scores={a425_freeze=240..255}] at @s if score #timer a425_freeze matches 0 run damage @s 1 minecraft:freeze

# Y=256..287: Severe Freezing (Slowness 3, heavy particles, 1 freeze damage every 1.5 seconds)
execute as @a[scores={a425_freeze=256..287}] at @s run effect give @s minecraft:slowness 1 2 true
execute as @a[scores={a425_freeze=256..287}] at @s run particle minecraft:snowflake ~ ~1 ~ 1.5 1.5 1.5 0.05 20
execute as @a[scores={a425_freeze=256..287}] at @s if score #timer a425_freeze matches 0 run damage @s 1 minecraft:freeze
execute as @a[scores={a425_freeze=256..287}] at @s if score #timer a425_freeze matches 30 run damage @s 1 minecraft:freeze

# Y=288+: Extreme Freezing (Slowness 4, massive particles, 1 freeze damage every 0.5 seconds)
execute as @a[scores={a425_freeze=288..}] at @s run effect give @s minecraft:slowness 1 3 true
execute as @a[scores={a425_freeze=288..}] at @s run particle minecraft:snowflake ~ ~1 ~ 2 2 2 0.05 40
execute as @a[scores={a425_freeze=288..}] at @s if score #timer a425_freeze matches 0 run damage @s 1 minecraft:freeze
execute as @a[scores={a425_freeze=288..}] at @s if score #timer a425_freeze matches 10 run damage @s 1 minecraft:freeze
execute as @a[scores={a425_freeze=288..}] at @s if score #timer a425_freeze matches 20 run damage @s 1 minecraft:freeze
execute as @a[scores={a425_freeze=288..}] at @s if score #timer a425_freeze matches 30 run damage @s 1 minecraft:freeze
execute as @a[scores={a425_freeze=288..}] at @s if score #timer a425_freeze matches 40 run damage @s 1 minecraft:freeze
execute as @a[scores={a425_freeze=288..}] at @s if score #timer a425_freeze matches 50 run damage @s 1 minecraft:freeze