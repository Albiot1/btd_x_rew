function scr_bounties_initialize(){

    enum BOUNTY_RANK {
        LOW,
        MEDIUM,
        HIGH,
        MODERATELY_HIGH,
        VERY_HIGH,
        IMPOPPABLE,
        MODERATELY_ANNOYING,
        ANNOYING,
        VERY_ANNOYING,
        IMPOPPABLY_ANNOYING,
        ALMIGHTY,
        ANNOINGLY_ALMIGHTY
    }
    
    function Bounty(_id,_max_rank,_location,_medal_icon) constructor {
        rank = 0
        max_rank = _max_rank
        my_id = _id
        location = _location
        
        global.tracks[$ _location].setBounty(_id,_medal_icon)
        
    }
    
    global.bounty = {
        dialogue_finished:false,
        rewards:{
            monkey_money:[],
            bloon_points:[],
            xp:[],
            add: function (_type,_cash,_bloonp,_xp){
                monkey_money[_type] = _cash
                bloon_points[_type] = _bloonp
                xp[_type] = _xp
            }
        },
        list:{
            big_bully: new Bounty("big_bully",5,"monkey_meadows",spr_medals_big_bully),
            mighty_moab: new Bounty("mighty_moab",4,"monkey_fort",spr_medals_mighty_moab),
            horror_bloon: new Bounty("horror_bloon",4,"the_depths",spr_medals_horror_bloon),
            ufo_bloon: new Bounty("ufo_bloon",4,"bloon_oasis",spr_medals_ufo_bloon),
            super_bloon: new Bounty("super_bloon",4,"swamp_spirals",spr_medals_super_bloon),
            mother: new Bounty("mother",4,"minecarts",spr_medals_mother),
            annoying_bloon: new Bounty("annoying_bloon",5,"shade_woods",spr_medals_annoying_bloon),
            clown_bloon: new Bounty("clown_bloon",5,"omega_river",spr_medals_clown_bloon),
            blooming_bloon: new Bounty("blooming_bloon",4,"autumn_acres",spr_medals_blooming_bloon),
            track_crawler: new Bounty("track_crawler",4,"bloon_circles_x",spr_medals_track_crawler),
            tdom: new Bounty("tdom",4,"graveyard",spr_medals_tdom),
            flying_bloon: new Bounty("flying_bloon",4,"sky_battles",spr_medals_flying_bloon),
            bloon_knight: new Bounty("bloon_knight",4,"bloonlight_throwback",spr_medals_bloon_knight),
            worm_bloon: new Bounty("worm_bloon",4,"rubber_rug",spr_medals_worm_bloon)
        }
    }
    
    global.bounty.rewards.add(BOUNTY_RANK.LOW,200,2,100000)
    global.bounty.rewards.add(BOUNTY_RANK.MEDIUM,300,3,150000)
    global.bounty.rewards.add(BOUNTY_RANK.HIGH,500,5,250000)
    global.bounty.rewards.add(BOUNTY_RANK.MODERATELY_HIGH,400,4,200000)
    global.bounty.rewards.add(BOUNTY_RANK.VERY_HIGH,600,6,300000)
    global.bounty.rewards.add(BOUNTY_RANK.IMPOPPABLE,700,7,350000)
    global.bounty.rewards.add(BOUNTY_RANK.MODERATELY_ANNOYING,400,4,200000)
    global.bounty.rewards.add(BOUNTY_RANK.ANNOYING,500,5,250000)
    global.bounty.rewards.add(BOUNTY_RANK.VERY_ANNOYING,600,6,300000)
    global.bounty.rewards.add(BOUNTY_RANK.IMPOPPABLY_ANNOYING,700,7,350000)
    global.bounty.rewards.add(BOUNTY_RANK.ALMIGHTY,1000,10,500000)
    global.bounty.rewards.add(BOUNTY_RANK.ANNOINGLY_ALMIGHTY,1100,11,550000)
    
    
}