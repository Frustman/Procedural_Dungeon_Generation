// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_interpolated_noise(index){
      var intX = floor(index);
      var fractionalX = index - intX;

      var v1 = Scr_smoothed_noise(intX);
      var v2 = Scr_smoothed_noise(intX + 1);

      return lerp(v1 , v2 , fractionalX);
}