print("default.nut loaded\n");

fishbox_names <- ["hide_bonus", "worldmap", "home", "above", "groundwater", "playground", "end", "blueone", "bluetwo", "waterfalls", "temperature", "crazy", "afraid", "escape", "foreign", "hang", "latern", "colder", "spikes", "stars", "without", "harbor", "shaft", "slippery", "enjoy", "spooky", "staple", "bombastic", "carry", "windy", "freeze", "bonus", "hail", "lotus", "down", "bridge", "reaching"];

if(! ("fishboxes" in state)){
	state.fishboxes <- {};
	print("fishbox state initiallized\n");
}
foreach(name in fishbox_names){
	if(!(name in state.fishboxes)){
		state.fishboxes[name] <- false;
		state.fishboxes["hide_bonus"] <- true;
		print("corrected fishbox state\n");
	}
}

state.fishboxes["worldmap"] <- true;

progress <- state.fishboxes;

//CUT SCENE FUNCTIONS
if("secrettop" in this){
	state.skip_scene1 <- false;
	state.skip_scene2 <- false;
	state.skip_scene3 <- false;
}

function watch1(){
	temp <- state.skip_scene1;
	state.skip_scene1 <- true;
	return temp;
}

function watch2(){
	temp <- state.skip_scene2;
	state.skip_scene2 <- true;
	return temp;
}

function watch3(){
	temp <- state.skip_scene3;
	state.skip_scene3 <- true;
	return temp;
}


//MECHANIC FUNCTIONS
function find_fish(box){
	if(!(progress[box])){
		progress[box] <- true;
		save_progress();
		display_fishbox(box);
		play_sound("sounds/clapping.wav");
	}else{
		play_sound("sounds/warp.wav");
	}
	FISHBOX_IMAGE.set_visible(false);
}

function check_bonus(){
	if(progress["hide_bonus"] == false){
		secret.fade(1,0);
		secrettop.fade(0,0);
	}
	else{
		n <- 0;
		tot <- 0;
		foreach(name in fishbox_names){
			if(progress[name]){n++}
			tot ++;
		}
		if(n==tot){
			secret.fade(1,0);
			secrettop.fade(0,1.2);
			progress["hide_bonus"] <- false;
			save_progress();
			n <- 0;
			play_sound("sounds/invincible_start.ogg");
		}
	}
}

function query(box){return progress[box]}

function save_progress(){state.fishboxes <- progress;}

function delete_progress(){
	state.fishboxes <- {};
	foreach(name in fishbox_names){
		state.fishboxes[name] <- false;
	}
	state.fishboxes["hide_bonus"] <- true;
	state.fishboxes["worldmap"] <- true;
	progress <- state.fishboxes;
}

//DISPLAY FUNCTIONS
function display_fishbox(box){
	local x = 10;
	local y = 10;
	if(!("fishbox" in this)){
		fishbox <- FloatingImage("images/engine/hud/fishbox_level.sprite");
		fishbox.set_anchor_point(ANCHOR_TOP_LEFT);
		fishbox.set_pos(x,y);
	}
	fishbox.set_visible(true);
	fishbox.set_action(progress[box] ? "found" : "normal");
	if("FISHBOX_IMAGE" in this){
		FISHBOX_IMAGE.set_action("undiscovered");
		FISHBOX_IMAGE.set_visible(progress[box] ? false : true);
	}
}

function display_fishbox_counter(){
	local x = 10+34;
	local y = 10+10;
	display_fishbox("worldmap");
	if(!("fishcount" in this)){
		fishcount <- {};
		fishcount["text"] <- FloatingImage("images/engine/hud/fishbox_world.sprite");
		fishcount["text"].set_anchor_point(ANCHOR_TOP_LEFT);
		fishcount["text"].set_pos(x+32,y);
		//found digits:
		fishcount["fTEN"] <- FloatingImage("images/engine/hud/fishbox_digit.sprite");
		fishcount["fTEN"].set_anchor_point(ANCHOR_TOP_LEFT);
		fishcount["fTEN"].set_pos(x,y);
		fishcount["fONE"] <- FloatingImage("images/engine/hud/fishbox_digit.sprite");
		fishcount["fONE"].set_anchor_point(ANCHOR_TOP_LEFT);
		fishcount["fONE"].set_pos(x+16,y);
		//total digits:
		fishcount["tTEN"] <- FloatingImage("images/engine/hud/fishbox_digit.sprite");
		fishcount["tTEN"].set_anchor_point(ANCHOR_TOP_LEFT);
		fishcount["tTEN"].set_pos(x+48,y);
		fishcount["tONE"] <- FloatingImage("images/engine/hud/fishbox_digit.sprite");
		fishcount["tONE"].set_anchor_point(ANCHOR_TOP_LEFT);
		fishcount["tONE"].set_pos(x+64,y);
	}
	fishcount["text"].set_visible(true);
	fishcount["fTEN"].set_visible(true);
	fishcount["fONE"].set_visible(true);
	fishcount["tTEN"].set_visible(true);
	fishcount["tONE"].set_visible(true);
	
	temp <- 0;
	tot <- 0;
	foreach(name in fishbox_names){
		if(progress[name])
			temp++;
		tot++
	}
	tot -= 2;
	temp--;//worldmap does not count toward total
	if(progress["hide_bonus"])
		temp--;//hide_bonus does not count toward total
	set_digit("fTEN",temp/10);
	set_digit("fONE",temp%10);
	set_digit("tTEN",tot/10);
	set_digit("tONE",tot%10);
}

function set_digit(digit,number){
	if(number==0){fishcount[digit].set_action("0");
	}else if(number==1){fishcount[digit].set_action("1");
	}else if(number==2){fishcount[digit].set_action("2");
	}else if(number==3){fishcount[digit].set_action("3");
	}else if(number==4){fishcount[digit].set_action("4");
	}else if(number==5){fishcount[digit].set_action("5");
	}else if(number==6){fishcount[digit].set_action("6");
	}else if(number==7){fishcount[digit].set_action("7");
	}else if(number==8){fishcount[digit].set_action("8");
	}else if(number==9){fishcount[digit].set_action("9");
	}else{print("fishbox counter error\n");}
}