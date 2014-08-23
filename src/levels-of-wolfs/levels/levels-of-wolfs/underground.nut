if(! ("underground" in state)){
	state.underground <- false;
  print("underground state initialized\n");
}

function go_underground(under){
  Interactive.fade(under ? 0 : 1, 1);
  Background.fade(under ? 0 : 1, 1);
  Foreground.fade(under ? 0 : 1, 1);
  Foreground2.fade(under ? 0 : 1, 1);

  Interactive_Cave.fade(under ? 1 : 0, 1);
  Background_Cave.fade(under ? 1 : 0, 1);
  Foreground_Cave.fade(under ? 1 : 0, 1);
  Foreground_Cave2.fade(under ? 1 : 0, 1);

  state.underground <- under;
}

go_underground(state.underground);
