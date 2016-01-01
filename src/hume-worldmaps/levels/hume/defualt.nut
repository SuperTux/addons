print("hume/defualt.nut loaded\n");
archind <- ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","aa","ab","ac","ad","ae","af","ag","ah","ai","aj"]
archtext <- {a="1\nplay the first level"
             b="2\nget to the free room"
             c="3\nplay level named unlocked archivements"
             d="4\nfind the secret level in the forest sequence"
             e="5\nget for a help for archivements"
             f="6\npass trough the tunnel"
             g="7\nplay the bonus level in the icy sequence"
             h="8\nfind the secret level in the icy sequence"
             i="9\nbuild the highest totem"
             j="10\nplay a level in icy sequence"
             k="11\nkill a yeti"
             l="12\nuse the detour trough crystal sequence"
             m="13\nplay a level in the crystal sequence"
             n="14\nplay the bonus level in the crystal sequence"
             o="15\nfind the secret level in the crystal sequence"
             p="16\ncomplete the detour trough crystal sequence"
             q="17\nfind a secret platform"
             r="18\n60s to double score"
             s="19\nplay a level in the dark-forest sequence"
             t="20\nplay the bonus level in the dark-forest sequence"
             u="21\nfind the secret level in the dark-forest sequence"
             v="22\nelectrifying pass"
             w="23\nfinish the impossible-hard level"
             x="24\npass, but not destroy"
             y="25\nplay a level in the water sequence"
             z="26\nplay the bonus level in the water sequence"
             aa="27\nfind the secret level in the water sequence"
             ab="28\nclear all yetis on the iceberg"
             ac="29\ncomplete the hanoii game"
             ad="30\nwhere trampolines continue?"
             ae="31\nfind the secret sequence"
             af="32\nplay a level in the secret sequence"
             ag="33\nplay the non-secret bonus level in the secret sequence"
             ah="34\nfind the secret level in the secret sequence"
             ai="35\nbest survivor"
             aj="36\nI don't want bonus"}
if(! ("hume_archivements" in state)){
 state.hume_archivements <- {}
 foreach(name in archind){
  state.hume_archivements[name] <- false;
 }
}
archivements <- state.hume_archivements;

function save_archivements(){
 state.hume_archivements <- archivements;
}

function archivinit(){
 function update(){
  archso <- {
           a=so1
           b=so2
           c=so3
           d=so4
           e=so5
           f=so6
           g=so7
           h=so8
           i=so9
           j=so10
           k=so11
           l=so12
           m=so13
           n=so14
           o=so15
           p=so16
           q=so17
           r=so18
           s=so19
           t=so20
           u=so21
           v=so22
           w=so23
           x=so24
           y=so25
           z=so26
           aa=so27
           ab=so28
           ac=so29
           ad=so30
           ae=so31
           af=so32
           ag=so33
           ah=so34
           ai=so35
           aj=so36}
  this.can_exit <- true;
  foreach(name in archind){
   if (archivements[name]){
    archso[name].set_visible(false);
   }else{
    this.can_exit <- false;
   }
  }
  if (archivements.ae){
   c1.set_burning(true);
   c2.set_burning(true);
   c3.set_burning(true);
   c4.set_burning(true);
   c5.set_burning(true);
  }
  if (this.can_exit){
   wait_for_screenswitch();
   display_text_file("levels/hume/extro1.txt");
   wait_for_screenswitch();
   Level.spawn("secro","main");
   this.unfinished <- false;
  }
 }
 this.unfinished <- true;
 unlock_archivement("c");
 while (this.unfinished) {
  update();
  wait(0.5);
 }
}

function delete_archivements(){
 state.hume_archivements <- {}
 foreach(name in archind){
  state.hume_archivements[name] <- false;
 }
}

function unlock_archivement(archivement){
 if (! (archivements[archivement])){
  archivements[archivement] <- true;
  Text.set_anchor_point(ANCHOR_TOP_LEFT);
  Text.set_pos(120,30);
  Text.set_text(_("Archivement ulocked! #")+_(archtext[archivement]));
  Text.fade_in(0.2);
  save_archivements();
  play_sound("sounds/invincible_start.ogg")
  wait(5);
  Text.fade_out(0.2);
 }
}
