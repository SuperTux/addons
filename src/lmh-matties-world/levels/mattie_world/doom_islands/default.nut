debug <- false;
if(debug) if(debug) print("doom_islands/default.nut loaded\n");

//INITIALIZATION OF BONUSES
bonus <- ["skycity" "secrets" "coins" "time" "frags"]

if(! ("island_bonus" in state) || ! ("island_reveal" in state)){
  state.island_bonus <- {};
  state.island_reveal <- {};
  foreach(name in bonus){
    state.island_bonus[name] <- false;
    state.island_reveal[name] <- false;
  }
  state.worlds["levels/mattie_world/doom_islands/worldmap.stwm"] <- {};
  state.worlds["levels/mattie_world/doom_islands/worldmap.stwm"].levels <- {};
  if(debug) print("bonuses for DOOM islands initialized\n");
}
else {
  foreach(name in bonus){
    if(!(name in state.island_bonus)){
      state.island_bonus[name] <- false;
      print("[DEBUG] compensated for DOOM island old profile format\n");
    }
    if(!(name in state.island_reveal)){
      state.island_reveal[name] <- false;
      print("[DEBUG] compensated for DOOM island old profile format\n");
    }
  }
}
if(! ("mattmap" in state)){state.mattmap <- false;}
if(! ("doommap" in state)){state.doommap <- true;}
if(! ("pennmap" in state)){state.pennmap <- false;}
if(!("worlds" in state)){
  state.worlds <- {};
  state.worlds["levels/mattie_world/doom_islands/worldmap.stwm"] <- {};
  state.worlds["levels/mattie_world/doom_islands/worldmap.stwm"].levels <- {};
}
if(! ("underground" in state)){
  state.underground <- false;
}

if(!("coin_level_active" in state)){
  state.coin_level_active <- "false";
  if(debug) print("active coin level state initialized\n");
}

progress <- state.island_bonus;
reward <- state.island_reveal;
levelvars <- state.worlds["levels/mattie_world/doom_islands/worldmap.stwm"].levels;
in_cave <- state.underground;

//FOLLOWING USED TO PREVENT ERROR DUE TO MAP SHORTENING
if(false){
  state.mattmap <- true;
  state.doommap <- false;
  exit_screen();
  load_worldmap("levels/mattie_world/worldmap.stwm");
}

//MAP FUNCTIONS
function go_underground(under){
  underground.fade(under ? 1 : 0, 1);
  underground_solid.fade(under ? 1 : 0, 1);
  underground_darkness.fade(under ? 1 : 0, 1);
  land.fade(under ? 0 : 1, 1);
  detail.fade(under ? 0 : 1, 1);
  mountain_near.fade(under ? 0 : 1, 1);
  mountain_far.fade(under ? 0 : 1, 1);
  mountain_veryfar.fade(under ? 0 : 1, 1);
  in_cave <- under;
  save_progress();
}

function find(egg){
  if (!(progress[egg])){
    progress[egg] <- true;
    reward[egg] <- true;
    save_progress();
  }
}

function set_map(){
  go_underground(in_cave);
  if("Yeti.stl" in levelvars)
    if("solved" in levelvars["Yeti.stl"])
      if(levelvars["Yeti.stl"].solved)
        shortcut.fade(1,1);
}

function toggle_mattmap(){
  state.mattmap <- !state.mattmap;
  if(state.mattmap){if(debug) print("worldmap Iceberg set\n");}
}
function get_mattmap(){ return state.mattmap; }
function toggle_doommap(){
  go_underground(false);
  state.doommap <- !state.doommap;
  if(state.doommap){if(debug) print("worldmap Islands set\n");}
}
function get_doommap(){ return state.doommap; }
function toggle_pennmap(){
  state.pennmap <- !state.pennmap;
  if(state.doommap){if(debug) print("worldmap Inland set\n");}
}
function get_pennmap(){ return state.pennmap; }

//OTHER FUNCTIONS
function query(item){return progress[item];}
function query_reward(item){return reward[item];}

function save_progress(){
  state.island_bonus <- progress;
  state.island_reveal <- reward;
  state.underground <- in_cave;
}

function  delete_progress(){
  state.island_bonus <- {}
  state.island_reveal <- {}
  foreach(name in bonus){
    state.island_bonus[name] <- false;
    state.island_reveal[name] <- false;
  }
}

function powerup(){play_sound("sounds/fire-flower.wav")}
function eggup(){play_sound("sounds/grow.ogg");}
function oneup(){play_sound("sounds/lifeup.wav");}
function badflower(){play_sound("sounds/tree_howling.ogg"); Tux.kill(false);}
function boom(){play_sound("sounds/explosion.wav");}

function coin_rain(){
  play_sound("sounds/upgrade.wav");
  flyingcoin.goto_node(1);
  wait(1.0);
  flyingcoin.fade(0,0);
  rain1.fade(0,0);
  rain2.fade(0,0.2);
  rain3.fade(0,0.4);
  rain4.fade(0,0.6);
  rain5.fade(0,0.8);
}
