/// @function Scr_noise(index)

function Scr_noise(index){
    index = (index<<13) ^ index;
    return ( 1.0 - ( (index * (index * index * 15731 + 789221) + 1376312589) & 0x7FFFFFFF) / 1073741824.0);
}