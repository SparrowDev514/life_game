
//white = 草食動物
//green = 草
//black = 肉食動物

//周りが草で自陣が肉食動物の時→自陣を草
//周りが草で自陣が草食動物の時→周りを草食動物
//周りが肉食で自陣が草食動物の時→自陣を肉食
//周りが肉食で自陣が草の時→周りを草
//周りが草食で自身が草→自身を草食
//周りが草食で自陣が肉食動物の時→周りを肉食
//周りが肉食で自陣も肉食→全て草
//周りが草食で自陣も草食→全て肉食
//周りが草で自陣も草→全て草食
//そのほか→そのまま
//lga[][2>][][3] → lga[][2>][][2]
//lga[][2>][][1] → lga[][3][][1]
//lga[][][2>][1] → lga[][][2>][3]
//lga[][][2>][1] → lga[][3][][1]
//lga[2>][][][2] → lga[2>][][][1]
//lga[2>][][][3] → lga[][][3][3]
//lga[][][3][3] → lga[][3][][2]
//lga[3][][][1] → lga[][][3][3]
//lga[][3][][2] → lga[3][][][1]
start:={
foreach facet ff do set facet color 3*random idiv 1;
set facet color white where color==blue;
it:=0;
histmap := sprintf "hist_map"
}

print_map:={
green_facet_num := 0;
white_facet_num := 0;
black_facet_num := 0;
foreach facet ff do {
	if(ff.color == white)then{
	white_facet_num += 1;
}};
foreach facet ff do {
	if(ff.color == green)then{
	green_facet_num += 1;
}};
foreach facet ff do {
	if(ff.color == black)then{
	black_facet_num += 1;
}};
printf"white facet number = %g\ngreen facet number = %g\nblack facet number = %g\n",white_facet_num,green_facet_num,black_facet_num;
it := it + 1;
printf "%g %g %g %g\n",it,white_facet_num,green_facet_num,black_facet_num  >> histmap;

}


play:={

define life_game_array real[4];
foreach facet ff do{
print_map;
{u;V;g};
life_game_array:=0;
if(facet[ff.id].color == white)then{
			  life_game_array[1] := -3;
			  life_game_array[4] := 1;
			  }else{
			  if(facet[ff.id].color == green)then{
			  		life_game_array[2] := -3;
					life_game_array[4] := 2;
					}else{
					life_game_array[3] := -3;
					life_game_array[4] := 3;
					}
				};
for(int:=1;int<=3;int++){
	for(inx:=1;inx<=2;inx++){
		if(facet[ff.id].edge[int].facet[inx].color == white)then{
							      life_game_array[1] += 1;
		}else{if(facet[ff.id].edge[int].facet[inx].color == green)then{
								    life_game_array[2] += 1;
								    }else{
								    life_game_array[3] += 1;
}}};
if(life_game_array[1]>=2 && life_game_array[4]==2)then{
			  set facet[ff.id] color white;
			  }else{if(life_game_array[1]>=2 && life_game_array[4]==3)then{
			  for(int:=1;int<=3;int++){
				for(inx:=1;inx<=2;inx++){
			  set facet[ff.id].edge[int].facet[inx] color black;
			      			   }	}
			  }else{
if(life_game_array[2]>=2 && life_game_array[4]==3)then{
			 set facet[ff.id] color green;
			 }else{if(life_game_array[2]>=2 && life_game_array[4]==1)then{
			 for(int:=1;int<=3;int++){
				for(inx:=1;inx<=2;inx++){
			  set facet[ff.id].edge[int].facet[inx] color white;
			      			   }	}
			 }else{
if(life_game_array[3]>=2 && life_game_array[4]==1)then{
			 set facet[ff.id] color black;
			 }else{if(life_game_array[3]>=2 && life_game_array[4]==2)then{
			for(int:=1;int<=3;int++){
				for(inx:=1;inx<=2;inx++){
			  set facet[ff.id].edge[int].facet[inx] color green;
			      			   }	}
			}else{
if(life_game_array[1]==3 && life_game_array[4]==1)then{
for(int:=1;int<=3;int++){
	for(inx:=1;inx<=2;inx++){
	set facet[ff.id].edge[int].facet[inx] color black;
											}  }
			}else{
if(life_game_array[2]==3 && life_game_array[4]==2)then{
for(int:=1;int<=3;int++){
	for(inx:=1;inx<=2;inx++){
	set facet[ff.id].edge[int].facet[inx] color white;
											}	}
			}else{
if(life_game_array[3]==3 && life_game_array[4]==3)then{
for(int:=1;int<=3;int++){
	for(inx:=1;inx<=2;inx++){
	set facet[ff.id].edge[int].facet[inx] color green;
											}  }
}}}}}}}}}}}}
