/*
  HH  HH  UU  UU  MM  MM  EEEEEE  ''   SSSSS
  HH  HH  UU  UU  MMMMMM  EE      ''  SS
  HHHHHH  UU  UU  MM  MM  EEEE    ''   SSSS
  HH  HH  UU  UU  MM  MM  EE              SS
  HH  HH   UUUU   MM  MM  EEEEEE      SSSSS

  RRRRR    AAAA   IIIIII  NN  NN  BBBBB    OOOO   WW  WW
  RR  RR  AA  AA    II    NNN NN  BB  BB  OO  OO  WW  WW
  RRRRR   AAAAAA    II    NNNNNN  BBBBB   OO  OO  WW  WW
  RR RR   AA  AA    II    NN NNN  BB  BB  OO  OO  WWWWWW
  RR  RR  AA  AA  IIIIII  NN  NN  BBBBB    OOOO   WW  WW
  
   CCCC    AAAA   VV  VV  EEEEEE
  CC  CC  AA  AA  VV  VV  EE
  CC      AAAAAA  VV  VV  EEEE
  CC  CC  AA  AA   VVVV   EE
   CCCC   AA  AA    VV    EEEEEE
  
  -SCRIPTS
  
 #######################
 #                     #
 #   Created by Hume   #
 #                     #
 #######################

Contents:

+----------------------------------------------------------------------+
| defualt.nut                                                          |
| -1 Documentation                                            line 44  |
|  -1.1 functions                                             line 58  |
|   -1.1.1 import("levels/hume_rainbow_cave/defualt.nut")     line 60  |
|   -1.1.2 secret_area("secret area")                         line 62  |
|   -1.1.3 complete_level(level group,level,sequence)         line 65  |
|   -1.1.4 found_crystal(crystal)                             line 74  |
|   -1.1.5 finish_level_group(level group, level)             line 76  |
|   -1.1.6 warp_to(sector,spawnpoint)                         line 78  |
|   -1.1.7 save_archivements()                                line 80  |
|   -1.1.8 archivinit()                                       line 82  |
|  -1.2 external scripts                                      line 85  |
|  -1.3 code.nut                                              line 90  |
|   -1.3.1 import("levels/hume_rainbow_cave/code.nut")        line 93  |
|   -1.3.2 vynuluj()                                          line 95  |
|   -pridej(number)                                           line 97  |
|  -1.4 octachoron.nut                                        line 100 |
|   -1.4.1 import("levels/hume_rainbow_cave/octachoron.nut")  line 103 |
|   -1.4.2 pridej(number)                                     line 105 |
|   -1.4.3 zvorej()                                           line 107 |
| -2 scripts                                                  line 110 |
+----------------------------------------------------------------------+

== 1 Documentation ==
 There are programmed all archivements in this worldmap.
 Play the first level for more information about archivements.

 =- 1.1 functions -=
    Use script...
  -- 1.1.1 import("levels/hume_rainbow_cave/defualt.nut") --
     ...for upload these functions.
  -- 1.1.2 secret_area("secret area") --
     ...for check secret area. Secret areas are named "sa1", "sa2", "sa3",
        ..."sa42".
  -- 1.1.3 complete_level(level group,level,sequence) --
     ...for complete level. Level groups are named "red", "orange", "yellow",
        "green", "blue", "purple" and "white". Red levels are named "r1", "r2",
        "r3",..."r6". Orange levels are named "o1", "o2", "o3",..."o6". Yellow
        levels are named "y1", "y2", "y3",..."y6". Green levels are named "g1",
        "g2", "g3",..."g6". Blue levels are named "b1", "b2", "b3",..."b6".
        Purple levels are named "p1", "p2", "p3",..."p6". White levels are named
        "w1", "w2", "w3",..."w6". Sequences are named "endsequence", "stoptux"
        and "fireworks".
  -- 1.1.4 found_crystal(crystal) =
     ...for check crystal. Crystals are named simlary as level groups.
  -- 1.1.5 finish_level_group(level group, level) --
     ...for finish level group. The level is the last level in level group.
  -- 1.1.6 warp_to(sector,spawnpoint) --
     ...for warp to target sector and spawn point
  -- 1.1.7 save_archivements() --
     ...for save archivements
  -- 1.1.8 archivinit() --
     ...for activate archivements in level "Unlocked archivements".
 
 =- 1.2 External scripts -=
    In some levels are used scripts from other files:
     "code.nut" in level "Bonus levels gate"
     "octachoron.nut" in level "Octachoral test"
  
 =- 1.3 code.nut -=
    Functions:
    Use script...
  -- 1.3.1 import("levels/hume_rainbow_cave/code.nut") --
     ...for upload these functions.
  -- 1.3.2 vynuluj() --
     ...for return the code to "_ _ _ _ _ _".
  -- 1.3.3 pridej(number) --
     ...for add a number to code.
 
 =- 1.4 octachoron.nut -=
    Functions:
    Use script...
  -- 1.4.1 import("levels/hume_rainbow_cave/octachoron.nut") --
     ...for upload these functions.
  -- 1.4.2 pridej(number) --
     ...for add a number to result.
  -- 1.4.3 zvorej() --
     ...for fail the question.

== 2 scripts ==

Do not read next text. You don't understand it.
*******************************************************************************/
 
println("[DEBUG] levels/hume_rainbow_cave/defualt.nut loaded");
println("[INFO] WELCOME IN HUME'S RAINBOW CAVE!");
println("[INFO] Created by Hume");

Text.set_anchor_point(ANCHOR_TOP_LEFT)
Text.set_pos(30,120)
archind <- ["goal","secret","crystal","red","orange","yellow","green","blue","purple","white"]
levels <- {red=["r1","r2","r3","r4","r5","r6"],orange=["o1","o2","o3","o4","o5","o6"],yellow=["y1","y2","y3","y4","y5","y6"],green=["g1","g2","g3","g4","g5","g6"],blue=["b1","b2","b3","b4","b5","b6"],purple=["p1","p2","p3","p4","p5","p6"],white=["w1","w2","w3","w4","w5","w6"]}
colors <- ["red","orange","yellow","green","blue","purple","white"]
secret_areas <- ["sa1","sa2","sa3","sa4","sa5","sa6","sa7","sa8","sa9","sa10","sa11","sa12","sa13","sa14","sa15","sa16","sa17","sa18","sa19","sa20","sa21","sa22","sa23","sa24","sa25","sa26","sa27","sa28","sa29","sa30","sa31","sa32","sa33","sa34","sa35","sa36","sa37","sa38","sa39","sa40","sa41","sa42"]

/**********************************
 *                                *
 *  Zarezervování místa v pameti  *
 *                                *
 **********************************/

if (!("hume_rainbow_cave" in state)) {
 state.hume_rainbow_cave <- {}
 state.hume_rainbow_cave.levels <- {}
 foreach (color in colors) {
  state.hume_rainbow_cave.levels[color] <- {}
  foreach (level in levels[color]) {
   state.hume_rainbow_cave.levels[color][level] <- false
  }
 }
 state.hume_rainbow_cave.secrets <- {}
  foreach (name in secret_areas) {
   state.hume_rainbow_cave.secrets[name] <- false
  }
 state.hume_rainbow_cave.crystals <- {}
 foreach (name in colors) {
  state.hume_rainbow_cave.crystals[name] <- false
 }
 state.hume_rainbow_cave.archivements <- {}
 foreach (name in archind) {
  state.hume_rainbow_cave.archivements[name] <- false
 }
/****************************
 *  hume_rainbow_cave       *
 *   -levels                *
 *    -red                  *
 *     -r1..r6              *
 *    -orange               *
 *     -o1..o6              *
 *    -yellow               *
 *     -y1..y6              *
 *    -green                *
 *     -g1..g6              *
 *    -blue                 *
 *     -b1..b6              *
 *    -purple               *
 *     -p1..p6              *
 *    -white                *
 *     -w1..w6              *
 *   -secrets               *
 *    -sa1..sa42            *
 *   -crystals              *
 *    -red,orange,yellow,   *
 *     green,blue,purple,   *
 *     white                *
 *   -archivements          *
 *    -goal,secret,crystal  *
 *    -red,orange,yellow,   *
 *     green,blue,purple,   *
 *     white                *
 ****************************/
}
archivements <- state.hume_rainbow_cave


/**************************************************
 *                                                *
 *  Init-script z úrovne "Unlocked archivements"  *
 *                                                *
 **************************************************/

function archivinit() {
 arch_goal <- 0
 arch_secret <- 0
 arch_crystal <- 0
 arch_red <- 0
 arch_orange <- 0
 arch_yellow <- 0
 arch_green <- 0
 arch_blue <- 0
 arch_purple <- 0
 arch_white <- 0
 foreach (name in secret_areas) {
  if (archivements.secrets[name]) {
   arch_secret <- arch_secret+1
  }
 }
 foreach (name in colors) {
  if (archivements.crystals[name]) {
   arch_crystal <- arch_crystal+1
  }
 }
 foreach (name in levels.red) {
  if (archivements.levels.red[name]) {
   arch_red <- arch_red+1
  }
 }
 foreach (name in levels.orange) {
  if (archivements.levels.orange[name]) {
   arch_orange <- arch_orange+1
  }
 }
 foreach (name in levels.yellow) {
  if (archivements.levels.yellow[name]) {
   arch_yellow <- arch_yellow+1
  }     
 }
 foreach (name in levels.green) {
  if (archivements.levels.green[name]) {
   arch_green <- arch_green+1
  }
 }
 foreach (name in levels.blue) {
  if (archivements.levels.blue[name]) {
   arch_blue <- arch_blue+1
  }
 }
 foreach (name in levels.purple) {
  if (archivements.levels.purple[name]) {
   arch_purple <- arch_purple+1
  }
 }
 foreach (name in levels.white) {
  if (archivements.levels.white[name]) {
   arch_white <- arch_white+1
  }
 }
 arch_goal <- arch_red+arch_orange+arch_yellow+arch_green+arch_blue+arch_purple+arch_white
 if(archivements.archivements.goal){
  if(archivements.archivements.crystal){
   if(archivements.archivements.secret){
    pipe.fade(0,1)
/*    wait_for_screenswitch();
    display_text_file("levels/hume_rainbow_cave/extro1.txt");
    wait(0.5)
    wait_for_screenswitch();
    Level.finish(true);*/
   }
  }
 }
}

function save_archivements(){
 state.hume_rainbow_cave <- archivements
}

/******************************************
 *                                        *
 *       Funkce k odemykání úspechu       *
 *                                        *
 *----------------------------------------*
 *                                        *
 *  complete_level(group,level,sequence)  *
 *  secret_area(sa)                       *
 *  finish_level_group(color,level)       *
 *  found_crystal(crystal)                *
 *                                        *
 ******************************************/
 
function complete_level(group,level,sequence){
 archivements.levels[group][level] <- true;
 save_archivements();
 sector.Tux.trigger_sequence(sequence)
}

function secret_area(sa) {
 archivements.secrets[sa] <- true;
 save_archivements();
 get_archivement <- true
 foreach (name in secret_areas) {
  get_archivement <- get_archivement && archivements.secrets[name]
 }
 if (get_archivement){
  if (!(archivements.archivements.secret)){
   archivements.archivements.secret <- true
   save_archivements();
   Text.set_text(_("You found all secret areas!"))
   play_sound("sounds/invincible_start.ogg")
   Text.fade_in(0.2)
   wait(5)
   Text.fade_out(0.2)
  }
 }
/****************************
 *                          *
 *   windows 7 je stracka   *
 *                          *
 ****************************/
}

function finish_level_group(color,level){
 complete_level(color,level,"fireworks")
 if (!(archivements.archivements[color])){
  invincible()
  archivements.archivements[color] <- true
  save_archivements();
  Text.set_text(_("You completed all "+color+" levels!"))
  play_sound("sounds/invincible_start.ogg")
  Text.fade_in(0.2)
  wait(3)
  Text.fade_out(0.2)
  get_archivement <- true
 }
 foreach (name in colors){
  get_archivement <- get_archivement && archivements.archivements[name]
  println(name+" is "+archivements.archivements[name])
 }
 if (get_archivement){
  if (!(archivements.archivements.goal)){
   archivements.archivements.goal <- true
   save_archivements();
   Text.set_text(_("You completed all levels!"))
   play_sound(_("sounds/invincible_start.ogg"))
   Text.fade_in(0.2)
   wait(3)
   Text.fade_out(0.2)
  }
 }
}

function found_crystal(crystal) {
 if (!(archivements.crystals[crystal])){
  play_sound("sounds/invincible_start.ogg")
 }else{
  play_sound("sounds/locked.ogg")
 }
 archivements.crystals[crystal] <- true;
 save_archivements();
 get_archivement <- true
 foreach (name in colors) {
  get_archivement <- get_archivement && archivements.crystals[name]
 }
 if (get_archivement){
  if (!(archivements.archivements.crystal)){
   archivements.archivements.crystal <- true
   save_archivements();
   Text.set_text(_("You reached all bonus crystals"))
   play_sound("sounds/invincible_start.ogg")
   Text.fade_in(0.2)
   wait(5)
   Text.fade_out(0.2)
  }
 }
}

function warp_to(sector,spawnpoint){
 play_sound("sounds/warp.wav")
 Tux.deactivate();
 Camera.set_mode("manual")
 Tux.set_visible(false);
 Effect.fade_out(2)
 wait(2)
 Level.spawn(sector,spawnpoint)
 Effect.fade_in(0)
 Tux.activate()
 Camera.set_mode("normal")
 Tux.set_visible(true);
}

/* EOF */
