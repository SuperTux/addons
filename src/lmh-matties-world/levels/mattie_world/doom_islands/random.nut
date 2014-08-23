print("doom_islands/random.nut loaded\n");

function set_random_level(random){
	random_background();
	
	bonus <- true;
	if(! random){  //used for testing
		print("Level not randomized!\n");
		Capricorn1.fade(1,0);
		Aquarius1.fade(1,0);
		Pisces3.fade(1,0);
		PiscesCave.fade(1,0);
		Aries3.fade(1,0);
		AriesCave.fade(1,0);
		Taurus2.fade(1,0);
		Gemini4.fade(1,0);
		Cancer2.fade(1,0);
		Leo2.fade(1,0);
		Virgo4.fade(1,0);
		Libra4.fade(1,0);
		LibraCover1.fade(0,0);
		LibraCover4.fade(1,0);
		Scorpio2.fade(1,0);
		Ophiuchus3.fade(1,0);
		OphiuchusCave.fade(1,0);
		Sagittarius3.fade(1,0);
		SagittariusCave.fade(1,0);
	}else{
		temp <- rand() % 4;
		if(temp == 1){
			Capricorn1.fade(1,0);
		}else if(temp == 2){
			Capricorn2.fade(1,0);
		}else if(temp == 3){
			Capricorn3.fade(1,0);
			CapricornCave.fade(1,0);
		}else{
			Capricorn4.fade(1,0);
		}
		
		temp2 <- rand() % 4;
		print("Level configuration: "+temp+" "+temp2+" ");
		if(!(temp == temp2))
			bonus <- false;
		if(temp2 == 1){
			Aquarius1.fade(1,0);
		}else if(temp2 == 2){
			Aquarius2.fade(1,0);
		}else if(temp2 == 3){
			Aquarius3.fade(1,0);
			AquariusCave.fade(1,0);
		}else{
			Aquarius4.fade(1,0);
		}
		
		temp <- rand() % 4;
		if(!(temp == temp2))
			bonus <- false;
		if(temp == 1){
			Pisces1.fade(1,0);
		}else if(temp == 2){
			Pisces2.fade(1,0);
		}else if(temp == 3){
			Pisces3.fade(1,0);
			PiscesCave.fade(1,0);
		}else{
			Pisces4.fade(1,0);
		}
		
		temp2 <- rand() % 4;
		print(temp+" "+temp2+" ");
		if(!(temp == temp2))
			bonus <- false;
		if(temp2 == 1){
			Aries1.fade(1,0);
		}else if(temp2 == 2){
			Aries2.fade(1,0);
		}else if(temp2 == 3){
			Aries3.fade(1,0);
			AriesCave.fade(1,0);
		}else{
			Aries4.fade(1,0);
		}

		temp <- rand() % 4;
		if(!(temp == temp2))
			bonus <- false;
		if(temp == 1){
			Taurus1.fade(1,0);
		}else if(temp == 2){
			Taurus2.fade(1,0);
		}else if(temp == 3){
			Taurus3.fade(1,0);
			TaurusCave.fade(1,0);
		}else{
			Taurus4.fade(1,0);
		}
		
		temp2 <- rand() % 4;
		print(temp+" "+temp2+" ");
		if(!(temp == temp2))
			bonus <- false;
		if(temp2 == 1){
			Gemini1.fade(1,0);
		}else if(temp2 == 2){
			Gemini2.fade(1,0);
		}else if(temp2 == 3){
			Gemini3.fade(1,0);
			GeminiCave.fade(1,0);
		}else{
			Gemini4.fade(1,0);
		}

		temp <- rand() % 4;
		if(!(temp == temp2))
			bonus <- false;
		if(temp == 1){
			Cancer1.fade(1,0);
		}else if(temp == 2){
			Cancer2.fade(1,0);
		}else if(temp == 3){
			Cancer3.fade(1,0);
			CancerCave.fade(1,0);
		}else{
			Cancer4.fade(1,0);
		}
		
		temp2 <- rand() % 4;
		print(temp+" "+temp2+" ");
		if(!(temp == temp2))
			bonus <- false;
		if(temp2 == 1){
			Leo1.fade(1,0);
		}else if(temp2 == 2){
			Leo2.fade(1,0);
		}else if(temp2 == 3){
			Leo3.fade(1,0);
			LeoCave.fade(1,0);
		}else{
			Leo4.fade(1,0);
		}

		temp <- rand() % 4;
		if(!(temp == temp2))
			bonus <- false;
		if(temp == 1){
			Virgo1.fade(1,0);
		}else if(temp == 2){
			Virgo2.fade(1,0);
		}else if(temp == 3){
			Virgo3.fade(1,0);
			VirgoCave.fade(1,0);
		}else{
			Virgo4.fade(1,0);
		}
		
		temp2 <- rand() % 4;
		print(temp+" "+temp2+" ");
		if(!(temp == temp2))
			bonus <- false;
		if(temp2 == 1){
			Libra1.fade(1,0);
		}else if(temp2 == 2){
			Libra2.fade(1,0);
		}else if(temp2 == 3){
			Libra3.fade(1,0);
			LibraCave.fade(1,0);
		}else{
			Libra4.fade(1,0);
			LibraCover1.fade(0,0);
			LibraCover4.fade(1,0);
		}

		temp <- rand() % 4;
		if(!(temp == temp2))
			bonus <- false;
		if(temp == 1){
			Scorpio1.fade(1,0);
		}else if(temp == 2){
			Scorpio2.fade(1,0);
		}else if(temp == 3){
			Scorpio3.fade(1,0);
			ScorpioCave.fade(1,0);
		}else{
			Scorpio4.fade(1,0);
		}
		
		temp2 <- rand() % 4;
		print(temp+" "+temp2+" ");
		if(!(temp == temp2))
			bonus <- false;
		if(temp2 == 1){
			Ophiuchus1.fade(1,0);
		}else if(temp2 == 2){
			Ophiuchus2.fade(1,0);
		}else if(temp2 == 3){
			Ophiuchus3.fade(1,0);
			OphiuchusCave.fade(1,0);
		}else{
			Ophiuchus4.fade(1,0);
		}

		temp <- rand() % 4;
		print(temp+"\n");
		if(!(temp == temp2))
			bonus <- false;
		if(temp == 1){
			Sagittarius1.fade(1,0);
		}else if(temp == 2){
			Sagittarius2.fade(1,0);
			SagittariusBack2.fade(1,0);
		}else if(temp == 3){
			Sagittarius3.fade(1,0);
			SagittariusCave.fade(1,0);
		}else{
			Sagittarius4.fade(1,0);
		}
	}
	
	if(bonus || coins){
		Zodiac.fade(0,0);
		ZodiacTop.fade(0,0);
	}
}

function random_background(){
	coins <- false;
	temp <- rand() % 3;
	temp2 <- rand() % 3;
	Background_Mid1.fade((temp == 0) ? 1 : 0, 0);
	Background_Mid2.fade((temp == 1) ? 1 : 0, 0);
	Background_Mid3.fade((temp == 2) ? 1 : 0, 0);
	Background_Far1.fade((temp2 == 0) ? 1 : 0, 0);
	Background_Far2.fade((temp2 == 1) ? 1 : 0, 0);
	Background_Far3.fade((temp2 == 2) ? 1 : 0, 0);
	if(temp == temp2)
		coins <- true;
	print("Background set to configuration "+temp+" "+temp2+"\n");
}

function bonus_rain(){
	if(coins || bonus){
		flyingcoin.goto_node(1);
		wait(1.0);
		flyingcoin.fade(0,0);
		if(coins){
			rain1.fade(0,0);
			rain2.fade(0,0.2);
			rain3.fade(0,0.4);
			rain4.fade(0,0.6);
			rain5.fade(0,0.8);
			coins <- false;
		}
		if(bonus){
			rain6.fade(0,0.5);
			rain7.fade(0,0.8);
			rain8.fade(0,1.3);
			bonus <- false;
		}
	}
}