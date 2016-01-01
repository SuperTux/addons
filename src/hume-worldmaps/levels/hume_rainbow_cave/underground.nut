print("[DEBUG] levels/hume_rainbow_cave/underground.nut loaded\n");

if(! ("jeskyne" in state)){
	state.jeskyne <- true;
}

function podzemak(j){
  fade_time <- 0.35;
  Foreground.fade(j ? 1 : 0.3, fade_time);
  frfr.fade(j ? 1 : 0.3, fade_time);
  state.jeskyne <- j;
}

podzemak(state.jeskyne);
