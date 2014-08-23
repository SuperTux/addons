print("pipes.nut loaded\n");
flip <-false;//flip concept abandoned
running <- false;
upready <- false;
upready2 <- false;
upready3 <- false;
upready4 <- false;
upready5 <- false;
upready6 <- false;

function EEEgo(){
	if(!running){
		running <- true;
		Tux.deactivate();
		if(!flip){
			if(!upready6){
				print("EkahiEluaEkolu going down...\n");
				EKAHIdown.goto_node(1);
				ELUAdown.goto_node(1);
				EKOLUdown.goto_node(1);
				EKAHIup.goto_node(0);
				ELUAup.goto_node(0);
				EKOLUup.goto_node(0);
				wait(1.2);
				EKAHImove.fade(1,0);
				ELUAmove.fade(1,0);
				EKOLUmove.fade(1,0);
				EKAHIdown.fade(0,0);
				ELUAdown.fade(0,0);
				EKOLUdown.fade(0,0);
				EKAHImove.goto_node(5);
				ELUAmove.goto_node(5);
				EKOLUmove.goto_node(3);
				wait(9.5);
				Tux.activate();
				EKAHImove.fade(0,0);
				ELUAmove.fade(0,0);
				EKOLUmove.fade(0,0);
				EKAHIdown.goto_node(0);
				ELUAdown.goto_node(0);
				EKOLUdown.goto_node(0);
				EKAHIdown.fade(1,0);
				ELUAdown.fade(1,0);
				EKOLUdown.fade(1,0);
				wait(1);
				upready6 <- true;
				EKAHIup.fade(1,0);
				ELUAup.fade(1,0);
				EKOLUup.fade(1,0);		
			}
			else{
				print("EkahiEluaEkolu going up...\n");
				EKAHIup.goto_node(1);
				ELUAup.goto_node(1);
				EKOLUup.goto_node(1);
				EKAHIdown.goto_node(3);
				ELUAdown.goto_node(3);
				EKOLUdown.goto_node(3);
				wait(1.2);
				EKAHImove.fade(1,0);
				ELUAmove.fade(1,0);
				EKOLUmove.fade(1,0);
				EKAHIdown.fade(1,0);
				ELUAdown.fade(1,0);
				EKOLUdown.fade(1,0);
				EKAHIup.fade(0,0);
				ELUAup.fade(0,0);
				EKOLUup.fade(0,0);
				EKAHImove.goto_node(0);
				ELUAmove.goto_node(0);
				EKOLUmove.goto_node(0);
				wait(9.5);
				EKAHImove.fade(0,0);
				ELUAmove.fade(0,0);
				EKOLUmove.fade(0,0);
				EKAHIdown.goto_node(0);
				ELUAdown.goto_node(0);
				EKOLUdown.goto_node(0);
				wait(2);
				upready6 <- false;
				Tux.activate();
				EKAHIup.goto_node(0);
				ELUAup.goto_node(0);
				EKOLUup.goto_node(0);
			}
		}
		Tux.activate();
		running <- false;
	}
}

function ABGgo(){
	if(!running){
		running <- true;
		Tux.deactivate();
		if(!flip){
			if(!upready5){
				print("AlphaBetaGamma going down...\n");
				ALPHAdown.goto_node(1);
				BETAdown.goto_node(1);
				GAMMAdown.goto_node(1);
				ALPHAup.goto_node(0);
				BETAup.goto_node(0);
				GAMMAup.goto_node(0);
				wait(1.2);
				ALPHAmove.fade(1,0);
				BETAmove.fade(1,0);
				GAMMAmove.fade(1,0);
				ALPHAdown.fade(0,0);
				BETAdown.fade(0,0);
				GAMMAdown.fade(0,0);
				ALPHAmove.goto_node(5);
				BETAmove.goto_node(5);
				GAMMAmove.goto_node(3);
				wait(9.5);
				Tux.activate();
				ALPHAmove.fade(0,0);
				BETAmove.fade(0,0);
				GAMMAmove.fade(0,0);
				ALPHAdown.goto_node(0);
				BETAdown.goto_node(0);
				GAMMAdown.goto_node(0);
				ALPHAdown.fade(1,0);
				BETAdown.fade(1,0);
				GAMMAdown.fade(1,0);
				wait(1);
				upready5 <- true;
				ALPHAup.fade(1,0);
				BETAup.fade(1,0);
				GAMMAup.fade(1,0);		
			}
			else{
				print("AlphaBetaGamma going up...\n");
				ALPHAup.goto_node(1);
				BETAup.goto_node(1);
				GAMMAup.goto_node(1);
				ALPHAdown.goto_node(3);
				BETAdown.goto_node(3);
				GAMMAdown.goto_node(3);
				wait(1.2);
				ALPHAmove.fade(1,0);
				BETAmove.fade(1,0);
				GAMMAmove.fade(1,0);
				ALPHAdown.fade(1,0);
				BETAdown.fade(1,0);
				GAMMAdown.fade(1,0);
				ALPHAup.fade(0,0);
				BETAup.fade(0,0);
				GAMMAup.fade(0,0);
				ALPHAmove.goto_node(0);
				BETAmove.goto_node(0);
				GAMMAmove.goto_node(0);
				wait(9.5);
				ALPHAmove.fade(0,0);
				BETAmove.fade(0,0);
				GAMMAmove.fade(0,0);
				ALPHAdown.goto_node(0);
				BETAdown.goto_node(0);
				GAMMAdown.goto_node(0);
				wait(2);
				upready5 <- false;
				Tux.activate();
				ALPHAup.goto_node(0);
				BETAup.goto_node(0);
				GAMMAup.goto_node(0);
			}
		}
		Tux.activate();
		running <- false;
	}
}

function UDTgo(){
	if(!running){
		running <- true;
		Tux.deactivate();
		if(!flip){
			if(!upready4){
				print("UnoDosTres going down...\n");
				UNOdown.goto_node(1);
				DOSdown.goto_node(1);
				TRESdown.goto_node(1);
				UNOup.goto_node(0);
				DOSup.goto_node(0);
				TRESup.goto_node(0);
				wait(1.2);
				UNOmove.fade(1,0);
				DOSmove.fade(1,0);
				TRESmove.fade(1,0);
				UNOdown.fade(0,0);
				DOSdown.fade(0,0);
				TRESdown.fade(0,0);
				UNOmove.goto_node(3);
				DOSmove.goto_node(5);
				TRESmove.goto_node(5);
				wait(9.5);
				Tux.activate();
				UNOmove.fade(0,0);
				DOSmove.fade(0,0);
				TRESmove.fade(0,0);
				UNOdown.goto_node(0);
				DOSdown.goto_node(0);
				TRESdown.goto_node(0);
				UNOdown.fade(1,0);
				DOSdown.fade(1,0);
				TRESdown.fade(1,0);
				wait(1);
				upready4 <- true;
				UNOup.fade(1,0);
				DOSup.fade(1,0);
				TRESup.fade(1,0);		
			}
			else{
				print("UnoDosTres going up...\n");
				UNOup.goto_node(1);
				DOSup.goto_node(1);
				TRESup.goto_node(1);
				UNOdown.goto_node(3);
				DOSdown.goto_node(3);
				TRESdown.goto_node(3);
				wait(1.2);
				UNOmove.fade(1,0);
				DOSmove.fade(1,0);
				TRESmove.fade(1,0);
				UNOdown.fade(1,0);
				DOSdown.fade(1,0);
				TRESdown.fade(1,0);
				UNOup.fade(0,0);
				DOSup.fade(0,0);
				TRESup.fade(0,0);
				UNOmove.goto_node(0);
				DOSmove.goto_node(0);
				TRESmove.goto_node(0);
				wait(9.5);
				UNOmove.fade(0,0);
				DOSmove.fade(0,0);
				TRESmove.fade(0,0);
				UNOdown.goto_node(0);
				DOSdown.goto_node(0);
				TRESdown.goto_node(0);
				wait(2);
				upready4 <- false;
				Tux.activate();
				UNOup.goto_node(0);
				DOSup.goto_node(0);
				TRESup.goto_node(0);
			}
		}
		Tux.activate();
		running <- false;
	}
}

function primarysecondaryskip(){
	if(!running){
		running <- true;
		if(!flip){
			print("PrimarySecondary skipped\n");
			PRIMARYdown.goto_node(0);
			SECONDARYdown.goto_node(0);
			PRIMARYdown.fade(1,0);
			SECONDARYdown.fade(1,0);
			PRIMARYup.goto_node(0);
			SECONDARYup.goto_node(0);
			if(!upready3){
				PRIMARYup.fade(1,0);
				SECONDARYup.fade(1,0);
				PRIMARYmove.goto_node(5);
				SECONDARYmove.goto_node(7);
				upready3 <- true;
			}
			else{
				PRIMARYup.fade(0,0);
				SECONDARYup.fade(0,0);
				PRIMARYmove.goto_node(0);
				SECONDARYmove.goto_node(0);
				upready3 <- false;
			}
		}
		running <- false;
		onetwothreego();
	}
}


function primarysecondarygo(){
	if(!running){
		running <- true;
		Tux.deactivate();
		if(!flip){
			if(!upready3){
				print("PrimarySecondary going down...\n");
				PRIMARYdown.goto_node(1);
				SECONDARYdown.goto_node(1);
				PRIMARYup.goto_node(0);
				SECONDARYup.goto_node(0);
				wait(1.2);
				PRIMARYmove.fade(1,0);
				SECONDARYmove.fade(1,0);
				PRIMARYdown.fade(0,0);
				SECONDARYdown.fade(0,0);
				PRIMARYmove.goto_node(5);
				SECONDARYmove.goto_node(7);
				wait(10.5);
				PRIMARYmove.fade(0,0);
				Tux.activate();
				wait(6);
				SECONDARYmove.fade(0,0);
				PRIMARYdown.goto_node(0);
				SECONDARYdown.goto_node(0);
				PRIMARYdown.fade(1,0);
				SECONDARYdown.fade(1,0);
				wait(1);
				upready3 <- true;
				PRIMARYup.fade(1,0);
				SECONDARYup.fade(1,0);			
			}
			else{
				print("PrimarySecondary going up...\n");
				PRIMARYup.goto_node(1);
				SECONDARYup.goto_node(1);
				PRIMARYdown.goto_node(3);
				SECONDARYdown.goto_node(3);
				wait(1.2);
				PRIMARYmove.fade(1,0);
				SECONDARYmove.fade(1,0);
				PRIMARYdown.fade(1,0);
				SECONDARYdown.fade(1,0);
				PRIMARYup.fade(0,0);
				SECONDARYup.fade(0,0);
				PRIMARYmove.goto_node(0);
				SECONDARYmove.goto_node(0);
				wait(10.5);
				PRIMARYmove.fade(0,0);
				PRIMARYdown.goto_node(0);
				wait(2);
				Tux.activate();
				wait(4);
				SECONDARYmove.fade(0,0);
				SECONDARYdown.goto_node(0);
				wait(2);
				upready3 <- false;
				PRIMARYup.goto_node(0);
				SECONDARYup.goto_node(0);
			}
		}
		Tux.activate();
		running <- false;
	}
}

function onetwothreego(){
	if(!running){
		running <- true;
		Tux.deactivate();
		if(!flip){
			if(!upready2){
				print("123 going down...\n");
				ONEdown.goto_node(1);
				TWOdown.goto_node(1);
				ONEup.goto_node(0);
				TWOup.goto_node(0);
				THREEmove.fade(0,0);
				wait(1.2);
				ONEmove.fade(1,0);
				TWOmove.fade(1,0);
				ONEdown.fade(0,0);
				TWOdown.fade(0,0);
				ONEmove.goto_node(5);
				TWOmove.goto_node(3);
				THREEmove.goto_node(1);
				wait(2);
				Tux.activate();
				wait(5.5);
				ONEmove.fade(0,0);
				TWOmove.fade(0,0);
				ONEdown.goto_node(0);
				TWOdown.goto_node(0);
				ONEdown.fade(1,0);
				TWOdown.fade(1,0);
				THREEmove.fade(1,0);
				wait(1);
				upready2 <- true;
				ONEup.fade(1,0);
				TWOup.fade(1,0);			
			}
			else{
				print("123 going up...\n");
				ONEup.goto_node(1);
				TWOup.goto_node(1);
				ONEdown.goto_node(3);
				TWOdown.goto_node(3);
				THREEmove.goto_node(0);
				wait(1.2);
				ONEmove.fade(1,0);
				TWOmove.fade(1,0);
				ONEdown.fade(1,0);
				TWOdown.fade(1,0);
				ONEup.fade(0,0);
				TWOup.fade(0,0);
				ONEmove.goto_node(0);
				TWOmove.goto_node(0);
				wait(7.5);
				ONEmove.fade(0,0);
				TWOmove.fade(0,0);
				ONEdown.goto_node(0);
				TWOdown.goto_node(0);
				upready2 <- false;
				Tux.activate();
				ONEup.goto_node(0);
				TWOup.goto_node(0);
			}
		}
		Tux.activate();
		running <- false;
	}
}

function ABCgo(){
	if(!running){
		running <- true;
		Tux.deactivate();
		if(!flip){
			if(!upready){
				print("ABC going down...\n");
				Adown.goto_node(1);
				Bdown.goto_node(1);
				Cdown.goto_node(1);
				Aup.goto_node(0);
				Bup.goto_node(0);
				Cup.goto_node(0);
				wait(1.2);
				Amove.fade(1,0);
				Bmove.fade(1,0);
				Cmove.fade(1,0);
				Adown.fade(0,0);
				Bdown.fade(0,0);
				Cdown.fade(0,0);
				Amove.goto_node(3);
				Bmove.goto_node(3);
				Cmove.goto_node(5);
				wait(4.5);
				Bmove.fade(0,0);
				wait(1);
				Tux.activate();
				wait(1);
				Amove.fade(0,0);
				wait(2);
				Cmove.fade(0,0);
				Adown.goto_node(0);
				Bdown.goto_node(0);
				Cdown.goto_node(0);
				Adown.fade(1,0);
				Bdown.fade(1,0);
				Cdown.fade(1,0);
				wait(1);
				upready <- true;
				Aup.fade(1,0);
				Bup.fade(1,0);
				Cup.fade(1,0);
			}
			else{
				print("ABC going up...\n");
				Aup.goto_node(1);
				Bup.goto_node(1);
				Cup.goto_node(1);
				Adown.goto_node(3);
				Bdown.goto_node(3);
				Cdown.goto_node(3);
				wait(1.2);
				Amove.fade(1,0);
				Bmove.fade(1,0);
				Cmove.fade(1,0);
				Adown.fade(1,0);
				Bdown.fade(1,0);
				Cdown.fade(1,0);
				Aup.fade(0,0);
				Bup.fade(0,0);
				Cup.fade(0,0);
				Cmove.goto_node(0);
				wait(2);
				Amove.goto_node(0);
				Bmove.goto_node(0);
				wait(6.5);
				Amove.fade(0,0);
				Bmove.fade(0,0);
				Cmove.fade(0,0);
				Adown.goto_node(0);
				Bdown.goto_node(0);
				Cdown.goto_node(0);
				wait(2);
				upready <- false;
				Tux.activate();
				Aup.goto_node(0);
				Bup.goto_node(0);
				Cup.goto_node(0);
			}
		}
		Tux.activate();
		running <- false;
	}
}

function allready(){
	if(!flip){
		Adown.goto_node(0);
		Bdown.goto_node(0);
		Cdown.goto_node(0);
		Aup.goto_node(0);
		Bup.goto_node(0);
		Cup.goto_node(0);
		Amove.goto_node(0);
		Bmove.goto_node(0);
		Cmove.goto_node(0);
		Adown.fade(1,0);
		Bdown.fade(1,0);
		Cdown.fade(1,0);
		Aup.fade(0,0);
		Bup.fade(0,0);
		Cup.fade(0,0);
		Amove.fade(0,0);
		Bmove.fade(0,0);
		Cmove.fade(0,0);
		
		ONEdown.goto_node(0);
		TWOdown.goto_node(0);
		ONEup.goto_node(0);
		TWOup.goto_node(0);
		ONEmove.goto_node(0);
		TWOmove.goto_node(0);
		THREEmove.goto_node(0);
		ONEdown.fade(1,0);
		TWOdown.fade(1,0);
		ONEup.fade(0,0);
		TWOup.fade(0,0);
		ONEmove.fade(0,0);
		TWOmove.fade(0,0);
		THREEmove.fade(1,0);
		
		PRIMARYdown.goto_node(0);
		SECONDARYdown.goto_node(0);
		PRIMARYup.goto_node(0);
		SECONDARYup.goto_node(0);
		PRIMARYmove.goto_node(0);
		SECONDARYmove.goto_node(0);
		PRIMARYdown.fade(1,0);
		SECONDARYdown.fade(1,0);
		PRIMARYup.fade(0,0);
		SECONDARYup.fade(0,0);
		PRIMARYmove.fade(0,0);
		SECONDARYmove.fade(0,0);
		
		UNOdown.goto_node(0);
		DOSdown.goto_node(0);
		TRESdown.goto_node(0);
		UNOup.goto_node(0);
		DOSup.goto_node(0);
		TRESup.goto_node(0);
		UNOmove.goto_node(0);
		DOSmove.goto_node(0);
		TRESmove.goto_node(0);
		UNOdown.fade(1,0);
		DOSdown.fade(1,0);
		TRESdown.fade(1,0);
		UNOup.fade(0,0);
		DOSup.fade(0,0);
		TRESup.fade(0,0);
		UNOmove.fade(0,0);
		DOSmove.fade(0,0);
		TRESmove.fade(0,0);
		
		ALPHAdown.goto_node(0);
		BETAdown.goto_node(0);
		GAMMAdown.goto_node(0);
		ALPHAup.goto_node(0);
		BETAup.goto_node(0);
		GAMMAup.goto_node(0);
		ALPHAmove.goto_node(0);
		BETAmove.goto_node(0);
		GAMMAmove.goto_node(0);
		ALPHAdown.fade(1,0);
		BETAdown.fade(1,0);
		GAMMAdown.fade(1,0);
		ALPHAup.fade(0,0);
		BETAup.fade(0,0);
		GAMMAup.fade(0,0);
		ALPHAmove.fade(0,0);
		BETAmove.fade(0,0);
		GAMMAmove.fade(0,0);
		
		EKAHIdown.goto_node(0);
		ELUAdown.goto_node(0);
		EKOLUdown.goto_node(0);
		EKAHIup.goto_node(0);
		ELUAup.goto_node(0);
		EKOLUup.goto_node(0);
		EKAHImove.goto_node(0);
		ELUAmove.goto_node(0);
		EKOLUmove.goto_node(0);
		EKAHIdown.fade(1,0);
		ELUAdown.fade(1,0);
		EKOLUdown.fade(1,0);
		EKAHIup.fade(0,0);
		ELUAup.fade(0,0);
		EKOLUup.fade(0,0);
		EKAHImove.fade(0,0);
		ELUAmove.fade(0,0);
		EKOLUmove.fade(0,0);
		
		print("pipe transfer mode set to normal\n");
	}
	else{
		Adown.goto_node(2);
		Bdown.goto_node(2);
		Cdown.goto_node(2);
		Aup.goto_node(2);
		Bup.goto_node(2);
		Cup.goto_node(2);
		Amove.goto_node(3);
		Bmove.goto_node(3);
		Cmove.goto_node(5);
		Adown.fade(0,0);
		Bdown.fade(0,0);
		Cdown.fade(0,0);
		Aup.fade(1,0);
		Bup.fade(1,0);
		Cup.fade(1,0);
		Amove.fade(0,0);
		Bmove.fade(0,0);
		Cmove.fade(0,0);
		
		
		
		pipetopsABC.fade(0,0);
		
		print("pipe transfer mode set to inverted\n");//mode abandoned
	}
}

function goexit(){
	Tux.deactivate();
	topblock.goto_node(2);
	Effect.fade_out(1); 
	wait(1); 
	Level.spawn("maze","exit"); 
	Effect.fade_in(1);
	wait(2);
	Tux.activate(); 
}

function endflag(val){
	Tux.deactivate();
	pole0.goto_node(val);
	endbonus.goto_node(val);
	endbonuscover.goto_node(val);
	wait(val+0.2);
	Tux.activate();
	Tux.walk(200);
}

function setrand(){
	temp <- rand() % 3;
	if(temp == 1){
		randA.fade(1,0);
		randB.fade(0,0);
		randC.fade(0,0);
		print("maze configuration A set\n");
	}
	else if(temp == 2){
		randA.fade(0,0);
		randB.fade(1,0);
		randC.fade(0,0);
		print("maze configuration B set\n");
	}
	else{
		randA.fade(0,0);
		randB.fade(0,0);
		randC.fade(1,0);
		print("maze configuration C set\n");
	}
}