//INITIALIZATION OF BONUSES
bonus <- [ "mineshaft" "airship" "castle" "crystalart" "moatart" "oasisart" "secrets" "coins" "time" "frags" "earthcrystal" "aircrystal" "firecrystal" "star"]
reglevels <- ["mattie_iceberg/L_DOOM.stl" "mattie_iceberg/L_Fields.stl" "mattie_iceberg/L_Quarry.stl" "mattie_iceberg/L_Mineshaft.stl" "mattie_iceberg/L_Dungeon.stl" "mattie_iceberg/L_HighRoute.stl" "mattie_iceberg/L_ScarySkies.stl" "mattie_iceberg/L_Cavern.stl" "mattie_iceberg/L_ThreeLanterns.stl" "mattie_iceberg/L_Meltbox.stl" "mattie_iceberg/L_Wall.stl" "mattie_iceberg/L_Moat.stl"]
stat_name <- ["coins-collected" "badguys-killed" "time-needed"]

if((! ("iceberg_bonus" in state)) || (! ("iceberg_reveal" in state))){																			
	state.iceberg_bonus <- {};
	state.iceberg_reveal <- {};
	foreach(name in bonus){																		
		state.iceberg_bonus[name] <- false;
		state.iceberg_reveal[name] <- false;
	}
	print("bonuses for mattie's iceberg initialized\n");
}
else {
	foreach(name in bonus){
		if(! (name in state.iceberg_bonus)){
			state.iceberg_bonus[name] <- false;
			print("compensated for mattie's iceberg old profile format\n");
		}
		if(! (name in state.iceberg_reveal)){
			state.iceberg_reveal[name] <- false;
			print("compensated for mattie's iceberg old profile format\n");
		}
	}
}
if(! ("mattmap" in state)){state.mattmap <- true;}
if(! ("doommap" in state)){state.doommap <- false;}
if(! ("pennmap" in state)){state.pennmap <- false;}
if(!("worlds" in state)){																			
	state.worlds <- {};																		
	state.worlds["levels/mattie_world/worldmap.stwm"] <- {};
	state.worlds["levels/mattie_world/worldmap.stwm"].levels <- {};
}

progress <- state.iceberg_bonus;
reward <- state.iceberg_reveal;																			
levelvars <- state.worlds["levels/mattie_world/worldmap.stwm"].levels;

//SHOP BONUS FUNCTIONS
function show_shop_rewards(){
	count <- 0.0;
	tot <- 0.0;
	foreach(name in reglevels){
		tot <- tot + 3;
		if(name in levelvars){
			foreach(type in stat_name){
				if("statistics" in levelvars[name]){
					if(type in levelvars[name].statistics){
						if(type == "time-needed"){
							set_time(name);
							if(levelvars[name].statistics[type] <= levelvars[name].statistics[type+"-total"]){
								count++;
								show_progress(name,type);
							}
						}else{
							if(levelvars[name].statistics[type] >= levelvars[name].statistics[type+"-total"]){
								count++;
								show_progress(name,type);
							}
						}
					}
				}
			}
		}
	}

	if(count <= tot/3)
		temp1 <- count/(tot/3);
	else
		temp1 <- 1;
	if(count <= tot*2/3)
		temp2 <- (count-2)/(tot*2/3);
	else
		temp2 <- 1;
	if(count < tot)
		temp3 <- (count-4)/tot;
	else
		temp3 <-1;
	
	EARTH.set_visible(progress["earthcrystal"] && !reward["earthcrystal"]);
	EARTH.set_action(progress["star"] ? "normal" : "still");
	AIR.set_visible(progress["aircrystal"] && !reward["aircrystal"]);
	AIR.set_action(progress["star"] ? "normal" : "still");
	FIRE.set_visible(progress["firecrystal"] && !reward["firecrystal"]);
	FIRE.set_action(progress["star"] ? "normal" : "still");
	STAR.set_visible(progress["star"]);
	
	ONE.fade(1-temp1,3);
	wait(2);
	TWO.fade(1-temp2,3);
	wait(2);
	THREE.fade(1-temp3,3);
}

function buy_powerup(type){
	if(type == "fire"){
		Tux.add_coins(-600);
		Tux.add_bonus("fireflower");
		powerup();
		wait(0.2);
		Tux.add_bonus("fireflower");
		powerup();
		wait(0.2);
		Tux.add_bonus("fireflower");
		powerup();
	}else if(type == "ice"){
		Tux.add_coins(-200);
		Tux.add_bonus("iceflower");
		powerup();
		wait(0.2);
		Tux.add_bonus("iceflower");
		powerup();
	}else{
		Tux.add_coins(-50);
		Tux.add_bonus("grow");
		eggup();
	}
}

function reveal_crystal(element){
	if(reward[element]){
		Tux.deactivate();
		reward[element] <- false;
		if(element == "earthcrystal")
			EARTH.set_visible(true);
		else if(element == "aircrystal")
			AIR.set_visible(true);
		else if(element == "firecrystal")
			FIRE.set_visible(true);
		oneup();
		wait(0.5);
		Tux.activate();
		save_progress();
		wait(3);
	}
}

function toggle_star_bonus(){
	if(progress["earthcrystal"] && progress["aircrystal"] && progress["firecrystal"] && !reward["earthcrystal"] && !reward["aircrystal"] && !reward["firecrystal"]){
		progress["star"] <- !progress["star"];
		save_progress();
		if(progress["star"])
			play_sound("sounds/invincible_start.ogg");
		STAR.set_visible(progress["star"]);
	EARTH.set_action(progress["star"] ? "normal" : "still");
	AIR.set_action(progress["star"] ? "normal" : "still");
	FIRE.set_action(progress["star"] ? "normal" : "still");
		wait(5);
	}
}

function set_time(level){
	if(level == "mattie_iceberg/L_DOOM.stl")
		temp <- 30;
	else if(level == "mattie_iceberg/L_Fields.stl")
		temp <- 23;
	else if(level == "mattie_iceberg/L_Quarry.stl")
		temp <- 20;
	else if(level == "mattie_iceberg/L_Mineshaft.stl")
		temp <- 32;
	else if(level == "mattie_iceberg/L_Dungeon.stl")
		temp <- 27;
	else if(level == "mattie_iceberg/L_HighRoute.stl")
		temp <- 38;
	else if(level == "mattie_iceberg/L_ScarySkies.stl")
		temp <- 39;
	else if(level == "mattie_iceberg/L_Cavern.stl")
		temp <- 20;
	else if(level == "mattie_iceberg/L_ThreeLanterns.stl")
		temp <- 60;
	else if(level == "mattie_iceberg/L_Wall.stl")
		temp <- 39;
	else if(level == "mattie_iceberg/L_Meltbox.stl")
		temp <- 28;
	else
		temp <- 44;
	levelvars[level].statistics["time-needed-total"] <- temp;
}

function show_progress(name, type){
	if(name == "mattie_iceberg/L_DOOM.stl" && type == "coins-collected")
		coin1.set_action("solved");
	if(name == "mattie_iceberg/L_DOOM.stl" && type == "badguys-killed")
		kill1.set_action("solved");
	if(name == "mattie_iceberg/L_DOOM.stl" && type == "time-needed")
		time1.set_action("solved");
	if(name == "mattie_iceberg/L_Fields.stl" && type == "coins-collected")
		coin2.set_action("solved");
	if(name == "mattie_iceberg/L_Fields.stl" && type == "badguys-killed")
		kill2.set_action("solved");
	if(name == "mattie_iceberg/L_Fields.stl" && type == "time-needed")
		time2.set_action("solved");
	if(name == "mattie_iceberg/L_Quarry.stl" && type == "coins-collected")
		coin3.set_action("solved");
	if(name == "mattie_iceberg/L_Quarry.stl" && type == "badguys-killed")
		kill3.set_action("solved");
	if(name == "mattie_iceberg/L_Quarry.stl" && type == "time-needed")
		time3.set_action("solved");
	if(name == "mattie_iceberg/L_Mineshaft.stl" && type == "coins-collected")
		coin4.set_action("solved");
	if(name == "mattie_iceberg/L_Mineshaft.stl" && type == "badguys-killed")
		kill4.set_action("solved");
	if(name == "mattie_iceberg/L_Mineshaft.stl" && type == "time-needed")
		time4.set_action("solved");
	if(name == "mattie_iceberg/L_Dungeon.stl" && type == "coins-collected")
		coin5.set_action("solved");
	if(name == "mattie_iceberg/L_Dungeon.stl" && type == "badguys-killed")
		kill5.set_action("solved");
	if(name == "mattie_iceberg/L_Dungeon.stl" && type == "time-needed")
		time5.set_action("solved");
	if(name == "mattie_iceberg/L_HighRoute.stl" && type == "coins-collected")
		coin6.set_action("solved");
	if(name == "mattie_iceberg/L_HighRoute.stl" && type == "badguys-killed")
		kill6.set_action("solved");
	if(name == "mattie_iceberg/L_HighRoute.stl" && type == "time-needed")
		time6.set_action("solved");
	if(name == "mattie_iceberg/L_ScarySkies.stl" && type == "coins-collected")
		coin7.set_action("solved");
	if(name == "mattie_iceberg/L_ScarySkies.stl" && type == "badguys-killed")
		kill7.set_action("solved");
	if(name == "mattie_iceberg/L_ScarySkies.stl" && type == "time-needed")
		time7.set_action("solved");
	if(name == "mattie_iceberg/L_Cavern.stl" && type == "coins-collected")
		coin8.set_action("solved");
	if(name == "mattie_iceberg/L_Cavern.stl" && type == "badguys-killed")
		kill8.set_action("solved");
	if(name == "mattie_iceberg/L_Cavern.stl" && type == "time-needed")
		time8.set_action("solved");
	if(name == "mattie_iceberg/L_ThreeLanterns.stl" && type == "coins-collected")
		coin9.set_action("solved");
	if(name == "mattie_iceberg/L_ThreeLanterns.stl" && type == "badguys-killed")
		kill9.set_action("solved");
	if(name == "mattie_iceberg/L_ThreeLanterns.stl" && type == "time-needed")
		time9.set_action("solved");
	if(name == "mattie_iceberg/L_Wall.stl" && type == "coins-collected")
		coin10.set_action("solved");
	if(name == "mattie_iceberg/L_Wall.stl" && type == "badguys-killed")
		kill10.set_action("solved");
	if(name == "mattie_iceberg/L_Wall.stl" && type == "time-needed")
		time10.set_action("solved");
	if(name == "mattie_iceberg/L_Meltbox.stl" && type == "coins-collected")
		coin11.set_action("solved");
	if(name == "mattie_iceberg/L_Meltbox.stl" && type == "badguys-killed")
		kill11.set_action("solved");
	if(name == "mattie_iceberg/L_Meltbox.stl" && type == "time-needed")
		time11.set_action("solved");
	if(name == "mattie_iceberg/L_Moat.stl" && type == "coins-collected")
		coin12.set_action("solved");
	if(name == "mattie_iceberg/L_Moat.stl" && type == "badguys-killed")
		kill12.set_action("solved");
	if(name == "mattie_iceberg/L_Moat.stl" && type == "time-needed")
		time12.set_action("solved");
}

//MAP BONUS FUNCTIONS
function find(egg){
	if (!(progress[egg])){
		progress[egg] <- true;
		reward[egg] <- true;
		save_progress();
	}
}

function show_map_rewards(){
	if(reward["secrets"]){
		wait(1);
		shop.fade(1,3);
		reward["secrets"] <- false;
		save_progress();
		play_sound("sounds/invincible_start.ogg");
	}else if(!progress["secrets"]){
		shop.fade(0,0);
	}
		
	if(reward["mineshaft"]){
		wait(1);
		SSH_MS.fade(0,0);
		SSB_MS.fade(1,3);
		reward["mineshaft"] <- false;
		save_progress();
		play_sound("sounds/invincible_start.ogg");
	}else if(!progress["mineshaft"]){
		SSB_MS.fade(0,0);
	}else
		SSH_MS.fade(0,0);
		
	if(reward["airship"]){
		wait(1);
		SSH_AS.fade(0,0);
		SSB_AS.fade(1,3);
		reward["airship"] <- false;
		save_progress();
		play_sound("sounds/invincible_start.ogg");
	}else if(!progress["airship"]){
		SSB_AS.fade(0,0);
	}else
		SSH_AS.fade(0,0);
	
	if(reward["castle"]){
		wait(1);
		SSH_TC.fade(0,0);
		SSB_TC.fade(1,3);
		reward["castle"] <- false;
		save_progress();
		play_sound("sounds/invincible_start.ogg");
	}else if(!progress["castle"]){
		SSB_TC.fade(0,0);
	}else
		SSH_TC.fade(0,0);
}

//ARTIFACT BONUS FUNCTIONS
function findart(egg){
	oneup();
	if (!(progress[egg])){
		progress[egg] <- true;
		reward[egg] <- true;
		wait(0.5);
		oneup();
		Tux.add_coins(100);
		wait(2.5);
		save_progress();
	}
	Tux.add_coins(50);
}

function revealart(artifact){
	if(reward[artifact]){
		Tux.deactivate();
		if(artifact=="crystalart")
			CRYSTAL.set_visible(true);
		else if(artifact=="moatart")
			MOAT.set_visible(true);
		else if(artifact=="oasisart")
			OASIS.set_visible(true);
		powerup();
		reward[artifact] <- false;
		wait(0.5);
		Tux.activate();
		save_progress();
	}
}

function artbonus(){
	Tux.deactivate();
	bonuspipe.goto_node(1);
	wait(2.2);
	temp <- 0;
	foreach(name in ["crystalart" "moatart" "oasisart"]){
		if(progress[name])
			temp++
	}
	if(temp>=3){
		Tux.add_bonus("fireflower");
		powerup();
		wait(0.2);
		Tux.add_bonus("fireflower");
		powerup();
		wait(0.2);
		Tux.add_bonus("fireflower");
		powerup();
	}else if(temp>=2){
		Tux.add_bonus("iceflower");
		powerup();
		wait(0.2);
		Tux.add_bonus("iceflower");
		powerup();
	}else{
		Tux.add_bonus("grow");
		eggup();
	}
	reward["star"] <- true;
	wait(0.2);
	bonuspipe.goto_node(0);
	wait(1.2);
	Tux.activate();
}

function earned_artbonus(){
	reward["star"] <- false;
}

//OTHER FUNCTIONS
function toggle_mattmap(){ 	state.mattmap <- !state.mattmap;	}
function get_mattmap(){ return state.mattmap; }
function toggle_doommap(){ 	state.doommap <- !state.doommap;	}
function get_doommap(){ return state.doommap; }
function toggle_pennmap(){ 	state.pennmap <- !state.pennmap;	}
function get_pennmap(){ return state.pennmap; }

function query(item){return progress[item];}
function query_reward(item){return reward[item];}

function save_progress(){
	state.iceberg_bonus <- progress;
	state.iceberg_reveal <- reward;
}

function	delete_progress(){
	state.iceberg_bonus <- {}
	state.iceberg_reveal <- {}
	foreach(name in bonus){
		state.iceberg_bonus[name] <- false;
		state.iceberg_reveal[name] <- false;
	}
}

function powerup(){play_sound("sounds/fire-flower.wav")}
function eggup(){play_sound("sounds/grow.ogg");}
function oneup(){play_sound("sounds/lifeup.wav");}

if(!("map" in this)){
	wait(1);
	if(reward["star"] && !("spinC" in this) && !("SuperSecret" in this) && !("gallery" in this)){
		reward["star"] <- false;
		Tux.kill(true);
	}
	else if(progress["star"])
		Tux.make_invincible();
}
