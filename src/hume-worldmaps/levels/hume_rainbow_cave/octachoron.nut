/*********************
 *                   *
 *  Created by Hume  *
 *                   *
 *********************/
println("[DEBUG] levels/hume_rainbow_cave/octachoron.nut loaded");
println("[INFO] Created by Hume");

this.kod <- 0
this.pokusy <- 0
rand()
this.a <- rand();
this.b <- rand();
this.randh <- rand();
this.a <- this.a %100
this.b <- this.b %100
this.randh <- this.randh%2
if(this.randh==1){
 this.operator <- " + "
 this.c <- this.a+this.b
}else{
 this.operator <- " - "
 this.c <- this.a-this.b
 if(this.c<0){
  this.rand <- this.a
  this.a <- this.b
  this.b <- this.rand
  this.c <- this.a-this.b
 }
}
Text.set_anchor_point(ANCHOR_TOP_LEFT);
Text.set_pos(30,120);
Text.set_text(this.a+this.operator+this.b+" = ?")
Text.fade_in(0.2);

function zvorej(){
 Text.set_text(_("WRONG!"))
 this.rand <- this.a%8
 if(this.rand==0){
  door1.goto_node(1)
 }
 if(this.rand==1){
  door2.goto_node(1)
 }
 if(this.rand==2){
  door3.goto_node(1)
 }
 if(this.rand==3){
  door4.goto_node(1)
 }
 if(this.rand==4){
  door5.goto_node(1)
 }
 if(this.rand==5){
  door6.goto_node(1)
 }
 if(this.rand==6){
  door7.goto_node(1)
 }
 if(this.rand==7){
  door8.goto_node(1)
 }
 rand()
}

function pridej(cislo){
 if(this.pokusy<3){
  this.kod <- this.kod*10+cislo
  this.pokusy <- this.pokusy+1
  Text.set_text(this.a+this.operator+this.b+" = "+this.kod)
  if(this.kod==this.c){
  Text.set_text(_("GOOD!"))
   this.pokusy <- 3
   door1.goto_node(1)
   door2.goto_node(1)
   door3.goto_node(1)
   door4.goto_node(1)
   door5.goto_node(1)
   door6.goto_node(1)
   door7.goto_node(1)
   door8.goto_node(1)
  }else{
   if(this.pokusy==3){
    zvorej()
   }
  }
 }
}
