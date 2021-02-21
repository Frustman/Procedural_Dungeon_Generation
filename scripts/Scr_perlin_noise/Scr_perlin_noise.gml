/// @function Scr_perlin_noise(index, range)

function Scr_perlin_noise(index, range){
	var chunkSize = 32;
	
	range = range / 2;
	
	var noise = 0;
	
	while(chunkSize > 0){
		var chunkIndex = index div chunkSize;
		
		var prog = (index % chunkSize) / chunkSize;
		
		var v0 = Scr_random_seed(chunkIndex, range);
		var v1 = Scr_random_seed(chunkIndex - 1, range);
		var v2 = Scr_random_seed(chunkIndex + 1, range);
		var v3 = Scr_random_seed(chunkIndex + 2, range);
		
		var P = (v3 - v2) - (v0 - v1);
		var Q = (v0 - v1) - P;
		var R = v2 - v0;
		var S = v1;

		noise += P * prog * prog * prog + Q * prog * prog + R * prog + S
		chunkSize = chunkSize div 2;
		range = range / 2;
		range = max(1, range);
	}
	return noise;
}