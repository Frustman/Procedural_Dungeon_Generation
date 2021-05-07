/// @function Scr_random_seed(seed, range)

function Scr_random_seed(seed, range){
	seed += irandom_range(10000000,1000000000);
	
	random_set_seed(seed);
	return random_range(0,range);
}