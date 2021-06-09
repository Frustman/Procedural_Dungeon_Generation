/// @function Scr_random_seed(seed, range)

function Scr_random_seed(seed, range){	
	random_set_seed(seed);
	return random_range(0,range);
}