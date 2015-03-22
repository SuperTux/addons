if(false) print("[DEBUG] blue_coins_five.nut loaded\n");

coin_names <- ["coin1", "coin2", "coin3", "coin4", "coin5"];
fade_names <- ["coin2", "coin4"]
doll_names <- ["coin1", "coin3", "coin5"];

if(! ("active_coins" in state)){
	state.active_coins <- {};
	print("coin state initiallized\n");
}
foreach(name in coin_names){
	if(!(name in state.active_coins))
		state.active_coins[name] <- false;
}

function display_coins(){
  yspace <- 11;
  xstart <- -152;
  xspace <- 20;

  local x = xstart - xspace*3;
  local y = yspace;

  if(! ("coin" in this))
    coin <- {};
  foreach(name in coin_names){
    if(!(name in coin)){
      coin[name] <- FloatingImage("images/engine/hud/blue_coin.sprite");
      coin[name].set_anchor_point(ANCHOR_TOP_RIGHT);
      coin[name].set_pos(x, y);
      coin[name].set_visible(true);
    }
    coin[name].set_action(state.active_coins[name] ? "found" : "normal");
    x += xspace;
  }

  temp <- true;
    foreach(name in coin_names){
      temp <- temp && state.active_coins[name];
    }
    if(temp)
      foreach(name in coin_names){
        coin[name].fade_out(13);
      }
}

function init_coins(){
  if(!("coin" in this)){ //needed to prevent accidental re-initiallization
    foreach(name in coin_names){
      state.active_coins[name] <- false;
    }
  }
  display_coins();
}

function find_coin(name){
  if((! (name in state.active_coins)) || (! (name in coin))){
    print("[DEBUG] found undocumented coin\n");
  } else{
    if(state.active_coins[name])
      print("[DEBUG] Found " + name + ", which has already been found\n");
    else{
      state.active_coins[name] <- true;
      coin[name].set_action("found");
      play_sound("sounds/coin.wav");
      display_coins();

      temp <- true;
      foreach(name in coin_names){
        temp <- temp && state.active_coins[name];
      }
      if(temp)
        found_all_coins();
    }
  }
}

function found_all_coins(){
	play_sound("sounds/invincible_start.ogg");
	foreach(name in fade_names){
		coin[name].fade_out(3);
	}
	foreach(name in doll_names){
		coin[name].set_action("reward");
	}
	wait(2.8);

	foreach(name in doll_names){
		play_sound("sounds/lifeup.wav");
		Tux.add_coins(100);
		coin[name].fade_out(5);
		for(local i=0;i<60;i+=1){
			wait(0.083);
			coin[name].set_pos(coin[name].get_pos_x()+1,yspace);
		}
	}
}

if(!(state.coin_level_active)){
  state.coin_level_active <- true;
  init_coins();
}
else display_coins();