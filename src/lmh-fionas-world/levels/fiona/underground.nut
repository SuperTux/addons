if(! ("underground" in state)){
	state.underground <- false;
  print("underground state initialized\n");
}

function go_underground(under){
  Land.fade(under ? 0 : 1, 1);
  Background.fade(under ? 0 : 1, 1);
  Foreground.fade(under ? 0 : 1, 1);
  Foreground_2.fade(under ? 0 : 1, 1);

  cave_background.fade(under ? 1 : 0, 1);
  cave_background_2.fade(under ? 1 : 0, 1);
  cave_darkness.fade(under ? 1 : 0, 1);
  cave_foreground.fade(under ? 1 : 0, 1);

  state.underground <- under;
}

go_underground(state.underground);
