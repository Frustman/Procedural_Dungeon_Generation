for(var i = 0; i < 20; i++){
	for(var j = 0; j < 20; j++){
		draw_text(i * 10, j * 10, global.map[#i, j]);
	}
}
for(var i = 1; i < 19; i++){
	for(var j = 1; j < 19; j++){
		draw_text(300 + i * 10, j * 10, Scr_Pdg_CountNeighbor(map, i, j));
	}
}