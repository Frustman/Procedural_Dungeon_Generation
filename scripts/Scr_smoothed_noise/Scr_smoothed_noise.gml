/// @function Scr_smoothed_noise(index)

function Scr_smoothed_noise(index){
    return Scr_noise(index)/2  +  Scr_noise(index-1)/4  +  Scr_noise(index+1)/4
}