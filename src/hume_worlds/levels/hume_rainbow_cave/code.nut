/*********************
 *                   *
 *  Created by Hume  *
 *                   *
 *********************/
println("[DEBUG] levels/hume_rainbow_cave/code.nut loaded");
println("[INFO] Created by Hume");

this.code<-{a="_",b="_",c="_",d="_",e="_",f="_"}
function vynuluj(){
this.code.a<-"_";
this.code.b<-"_";
this.code.c<-"_";
this.code.d<-"_";
this.code.e<-"_";
this.code.f<-"_";
this.posledni<-"a";
}
vynuluj();
Text.set_anchor_point(ANCHOR_TOP_LEFT);
Text.set_pos(30,120);
Text.set_text("Enter the code of bonus levels.")
Text.fade_in(0.2);

function pridej(cislo){
 if(this.posledni!="g"){
  this.code[this.posledni]<-cislo;
  this.kod<-this.code.a+this.code.b+this.code.c+this.code.d+this.code.e+this.code.f;
  Text.set_text(this.kod);
  if (this.posledni=="f"){
   this.posledni<-"g"
   if(this.kod=="567418"){
    Text.set_text("567418 - Bonus levels are unlocked!");
    sector.Tux.trigger_sequence("fireworks");
   }else{
    if(this.kod=="489641"){
    Text.set_text("489641 - 1 coin bonus!");
    sector.Tux.add_coins(1);
    vynuluj();
    }else{
     if(this.kod=="028976"){
     Text.set_text("028976 - 10 coins bonus!");
     sector.Tux.add_coins(10);
     vynuluj();
     }else{
      if(this.kod=="360126"){
      Text.set_text("360126 - 50 coins bonus!");
      sector.Tux.add_coins(50);
      vynuluj();
      }else{
       if(this.kod=="289221"){
       Text.set_text("289221 - 100 coins bonus!");
       sector.Tux.add_coins(100);
       vynuluj();
       }else{
        if(this.kod=="265813"){
        Text.set_text("265813 - 500 coins bonus!");
        sector.Tux.add_coins(100);
        sector.Tux.add_coins(100);
        sector.Tux.add_coins(100);
        sector.Tux.add_coins(100);
        sector.Tux.add_coins(100);
        vynuluj();
        }else{
         if(this.kod=="310412"){
         Text.set_text("310412 - Large Tux bonus!");
         sector.Tux.add_bonus("grow")
         vynuluj();
         }else{
          if(this.kod=="598126"){
          Text.set_text("598126 - Fire Tux bonus!");
          sector.Tux.add_bonus("fireflower")
          vynuluj();
          }else{
           if(this.kod=="860312"){
           Text.set_text("860312 - Ice Tux bonus!");
           sector.Tux.add_bonus("iceflower")
           vynuluj();
           }else{
            Text.set_text("Wrong code!");
            vynuluj();
           }
          }
         }
        }
       }
      }
     }
    }
   }
  }else{
   if (this.posledni=="e"){
    this.posledni<-"f"
   }
   if (this.posledni=="d"){
    this.posledni<-"e"
   }
   if (this.posledni=="c"){
    this.posledni<-"d"
   }
   if (this.posledni=="b"){
    this.posledni<-"c"
   }
   if (this.posledni=="a"){
    this.posledni<-"b"
   }
  }
 }
}