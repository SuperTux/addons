print("doom_islands/sky.nut loaded\n");

running <- false;
dropwave1 <- false;
dropwave2 <- false;
dropwave3 <- false;
jumpdropready <- false;

function wave_one(){
  if(!(running) && !(dropwave1)){
    running <- true;
    sign1.goto_node(2);
    stand1.fade(0,1.5);
    wait(1.2);
    
    drop1.fade(0,0);
    drop2.fade(0,1);
    drop3.fade(0,2);
    drop4.fade(0,6);
    drop5.fade(0,7);
    drop6.fade(0,8);
    wait(9.6);
    sign1.set_alpha(0);
    sign1.goto_node(3);
    
    sign2.goto_node(2);
    wait(0.3);
    sign3.goto_node(2);
    wait(0.3);
    sign1.set_alpha(1);
    sign1.goto_node(5);
    stand2.fade(0,0.6);
    wait(3.4);
    sign1.set_alpha(0);
    sign1.goto_node(6);
    sign2.set_alpha(0);
    sign2.goto_node(3);
    sign3.set_alpha(0);
    sign3.goto_node(3);
    
    stand3a.fade(0,1.8);
    stand3b.fade(0,0.2);
    stand3c.fade(0,1.8);
    wait(5);
    drop7.fade(0,0);
    drop8.fade(0,0.7);
    drop9.fade(0,0);
    wait(5);

    sign2.set_alpha(1);
    sign2.goto_node(5);
    wait(0.3);
    sign3.set_alpha(1);
    sign3.goto_node(5);
    stand4.fade(0,1.3);
    wait(3);
    sign2.fade(0,5);
    sign3.fade(0,5);
    
    push1.fade(1,0);
    push1.goto_node(2);
    wait(0.95);
    push1.fade(0,0);
    push2.fade(1,0);
    wait(1.5);
    push2.goto_node(2);
    wait(1);
    push2.fade(0,0);
    wait(1);
    push1.fade(1,0);
    push2.fade(1,0);
    
    mask.goto_node(1);
    dropwave1 <- true;
    print("dropwave one complete\n");
    running <- false;
  }
}

function wave_two(){
  if(!(running) && !(dropwave2)){
    running <- true;
    wt_drop0.fade(0, 0.5);
    wt_drop1.fade(0, 1.0);
    wt_drop2.fade(0, 1.5);
    wt_drop3.fade(0, 2.0);
    wt_drop4.fade(0, 2.5);
    wt_drop5.fade(0, 3);
    wait(4);
    pipeL.fade(1,0);
    pipeR.fade(1,0);
    pipeT.fade(1,0);
    pipeL.goto_node(1);
    pipeR.goto_node(1);
    pipeT.goto_node(1);
    weedL.fade(1,0);
    weedR.fade(1,0);
    weedT.fade(1,0);
    weedL.goto_node(1);
    weedR.goto_node(1);
    weedT.goto_node(1);
    sign2.goto_node(6);
    sign3.goto_node(6);

    wt_drop6.fade(0,0);
    wt_stand0.fade(0,5);
    wait(3.7);
    sign1.set_alpha(1);
    sign1.goto_node(8);
    wait(0.3);
    sign2.set_alpha(1);
    sign2.goto_node(8);
    wait(0.3);
    sign3.set_alpha(1);
    sign3.goto_node(8);
    
    wt_drop7.fade(0,1.7);
    wt_drop8.fade(0,2.1);
    wt_drop9.fade(0,1.3);
    wt_deliver1.goto_node(1);
    wt_hold1.goto_node(1);
    wt_block1.goto_node(1);
    wait(4);
    sign1.set_alpha(0);
    sign1.goto_node(9);
    sign2.set_alpha(0);
    sign2.goto_node(9);
    sign3.set_alpha(0);
    sign3.goto_node(9);

    wt_block1.fade(0,0.6);
    wt_hold1.fade(0,8);
    wait(4.3);
    sign1.set_alpha(1);
    sign1.goto_node(11);
    wait(0.3);
    sign2.set_alpha(1);
    sign2.goto_node(11);
    wait(0.3);
    sign3.set_alpha(1);
    sign3.goto_node(11);
    
    wt_drop10.fade(0,1.8);
    wt_drop11.fade(0,1.6);
    wt_drop12.fade(0,2.3);
    wt_deliver2.goto_node(3);
    wt_hold2.goto_node(1);
    wt_block2.goto_node(1);
    wait(4);
    
    wt_block2.fade(0,0.6);
    wt_hold2.fade(0,8);
    weedL.goto_node(0);
    weedR.goto_node(0);
    weedT.goto_node(0);
    wait(3.6);
    
    climb.fade(1,0);
    climb.goto_node(1);
    climb1.goto_node(1);
    
    mask.goto_node(2);
    dropwave2 <- true;
    print("dropwave two complete\n");
    running <- false;
  }
}

function wave_three(){
  if(!(running) && !(dropwave3)){
    running <- true;
    climb2.goto_node(1);
    platform_top.goto_node(1);
    push3.goto_node(1);
    push4.goto_node(1);
    push3.fade(0,9);
    push4.fade(0,9);
    wait(13);
    last_stand.goto_node(1);
    wait(8);
    jumpdropready <- true;
    
    dropwave3 <- true;
    print("dropwave three complete\n");
    running <- false;
  }
}
