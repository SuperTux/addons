print("doom_islands/Iceborer.nut loaded\n");

ready <- false;
iceborerHP <- 5;
hit <- false;
alive <- true;

function prepare_iceborer(){
	if(!ready){
		ready <- true;
		startpos <- 0;//rand() % 10;
		deliver.goto_node(startpos);
		bounceNbreak.goto_node(3*startpos);
		pain.goto_node(3*startpos);
		wait(6*startpos);
		bounceNbreak.fade(1,0);
		pain.fade(1,0);
		deliver.fade(0,0);
	}
}

function begin_iceborer_battle(){
	if(!running && ready){
		running <- true;
		play_music("music/bossattack.ogg");
		Tux.deactivate();
		walls.goto_node(1);
		wait(1);
		Tux.activate();
		wait(1);
		pos <- startpos;
		
		for(;alive;){
			bore_sequence();
			if(!alive)
				break;
			attack_sequence();
			if(!alive)
				break;
			flee_sequence();
		}		
	}
}

function bore_sequence(){
	//set_action
	wait(1);
	pain.fade(1,0);
	//set_action
	pos++;
	bounceNbreak.goto_node(pos);
	pain.goto_node(pos);
	wait(1.1);
}

function attack_sequence(){
	//set_action
	pain.fade(0,0);
	wait((rand()%2)/10.0+0.2*iceborerHP);
	if(!hit){
		//fire
		wait(2);
		wait(0.5+(rand()%iceborerHP)/10.0);
	}
	check_damage();
}

function flee_sequence(){
	//set_action
	pos++
	bounceNbreak.goto_node(pos);
	pain.goto_node(pos);
	wait(2.1);
	//set_action
	pos++;
	if(pos == 30)
		pos <- 0;
	bounceNbreak.goto_node(pos);
	pain.goto_node(pos);
	wait(3.1);
}

function check_damage(){
	if(hit){
		iceborerHP--;
		//set_action
		//update hud
		hit <- false;
		if(iceborerHP == 0)
			alive <- false;
	}
}