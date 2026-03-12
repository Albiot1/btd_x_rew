global.current_bloon_points = lerp(global.current_bloon_points,global.bloon_points,0.25)
global.current_monkey_money = lerp(global.current_monkey_money,global.monkey_money,0.25)
global.current_bloon_souls = lerp(global.current_bloon_souls,global.bloon_souls,0.25)
global.current_trophies = lerp(global.trophies,global.current_trophies,0.25)

if resources.draw_goodie_token == true
    global.current_goodie_points = lerp(global.current_goodie_points,global.goodie_points,0.25)