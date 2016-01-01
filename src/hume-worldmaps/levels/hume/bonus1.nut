print("hume/bonus1.nut loaded\n");
wheel <- {bonus=1,
          random=8}

function green()
{
 if (settings.get_ambient_green()>0.2){
  settings.set_ambient_light(settings.get_ambient_red(),settings.get_ambient_green()-0.2,settings.get_ambient_blue());
  Text.set_text(_("Purple spotlights up!\n+10 coins"));
  sector.Tux.add_coins(10*wheel.bonus);
  Text.fade_in(0.2);
 }else{
  Text.set_text(_("Purple bonus!\n+30 coins"));
  sector.Tux.add_coins(30*wheel.bonus);
  Text.fade_in(0.2);
 }
}

function red()
{
 if (settings.get_ambient_red()>0.2){
  settings.set_ambient_light(settings.get_ambient_red()-0.2,settings.get_ambient_green(),settings.get_ambient_blue());
  Text.set_text(_("Turquoise spotlights up!\n+10 coins"));
  sector.Tux.add_coins(10*wheel.bonus);
  Text.fade_in(0.2);
 }else{
  Text.set_text(_("Turquoise bonus!\n+30 coins"));
  sector.Tux.add_coins(30*wheel.bonus);
  Text.fade_in(0.2);
 }
}

function blue()
{
 if (settings.get_ambient_blue()>0.2){
  settings.set_ambient_light(settings.get_ambient_red(),settings.get_ambient_green(),settings.get_ambient_blue()-0.2);
  Text.set_text(_("Yellow spotlights up!\n+10 coins"));
  sector.Tux.add_coins(10*wheel.bonus);
  Text.fade_in(0.2);
 }else{
  Text.set_text(_("Yellow bonus!\n+30 coins"));
  sector.Tux.add_coins(30*wheel.bonus);
  Text.fade_in(0.2);
 }
}

function faster()
{
 wheel.bonus <- wheel.bonus+1;
 set_game_speed(1/wheel.bonus);
 Text.set_text(_("Gamespeed up!\n+20 coins"));
 sector.Tux.add_coins(20*wheel.bonus);
 Text.fade_in(0.2);
}

function skullyhop()
{
 badguy0.goto_node(1);
 Text.set_text(_("Insert skullyhop!\n+15 coins"));
 sector.Tux.add_coins(15*wheel.bonus);
 Text.fade_in(0.2);
 badguy0.goto_node(0);
}

function bouncingsnowball()
{
 badguy1.goto_node(1);
 Text.set_text(_("Insert bouncing snowball!\n+15 coins"));
 sector.Tux.add_coins(15*wheel.bonus);
 Text.fade_in(0.2);
 badguy1.goto_node(0);
}

function poisonivi()
{
 badguy2.goto_node(1);
 Text.set_text(_("Insert poison ivi!\n+15 coins"));
 sector.Tux.add_coins(15*wheel.bonus);
 Text.fade_in(0.2);
 badguy2.goto_node(0);
}

function snowball()
{
 badguy3.goto_node(1);
 Text.set_text(_("Insert snowball!\n+15 coins"));
 sector.Tux.add_coins(15*wheel.bonus);
 Text.fade_in(0.2);
 badguy3.goto_node(0);
}

function mriceblock()
{
 badguy4.goto_node(1);
 Text.set_text(_("Insert mr iceblock!\n+15 coins"));
 sector.Tux.add_coins(15*wheel.bonus);
 Text.fade_in(0.2);
 badguy4.goto_node(0);
}

function growtux();
{
 Text.set_text(_("No bonus\n *uf*"));
 Text.fade_in(0.2);
 sector.Tux.add_bonus("grow");
}

function vylosuj();
{
 wheel.random <- rand();//sector.TIME.get_time();
 wheel.random <- wheel.random%10;
 if (wheel.random==0){
  green();
 }else{if (wheel.random==1){
  red();
 }else{if (wheel.random==2){
  blue();
 }else{if (wheel.random==3){
  faster();
 }else{if (wheel.random==4){
  skullyhop();
 }else{if (wheel.random==5){
  bouncingsnowball();
 }else{if (wheel.random==6){
  poisonivi();
 }else{if (wheel.random==7){
  snowball();
 }else{if (wheel.random==8){
  mriceblock();
 }else{if (wheel.random==9){
  growtux();
 }}}}}}}}}}
}

function losuj()
{
 while(wheel.bonus<65536){
  wait(3);
  vylosuj();
 }
}
