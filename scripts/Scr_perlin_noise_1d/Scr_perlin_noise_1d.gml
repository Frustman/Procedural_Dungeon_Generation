// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_perlin_noise_1d(index){
	var total = 0;
    var p = 1/4;
    var n = 1;

	for(var i = 0; i < n; i++){
        var frequency = power(2,i);
        var amplitude = power(p,i);

        total = total + Scr_interpolated_noise(index * frequency) * amplitude;
	}
    return total;
}