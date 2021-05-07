/// @function Scr_array(*args) initialize arrays
function Scr_array(){
	///array(*args);
	var arr;
	for (var i=0;i<argument_count;i+=1)
	{
	    arr[i] = argument[i];
	}
	return arr;
}