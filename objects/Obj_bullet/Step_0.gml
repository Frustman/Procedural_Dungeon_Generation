tick += global.timeScale;
if(tick > event_tick){
    tick	= 0;
    var arr = bullet_tick_event_arg;
    var scr = bullet_tick_event;
    switch(array_length(arr)){
        case 0:
            script_execute(scr);
            break;
        case 1:
            script_execute(scr, arr[0]);
            break;
        case 2:
            script_execute(scr, arr[0], arr[1]);
            break;
        case 3:
            script_execute(scr, arr[0], arr[1], arr[2]);
            break;
        case 4:
            script_execute(scr, arr[0], arr[1], arr[2], arr[3]);
            break;
        case 5:
            script_execute(scr, arr[0], arr[1], arr[2], arr[3], arr[4]);
            break;
        case 6:
            script_execute(scr, arr[0], arr[1], arr[2], arr[3], arr[4], arr[5]);
            break;
        case 7:
            script_execute(scr, arr[0], arr[1], arr[2], arr[3], arr[4], arr[5], arr[6]);
            break;
        case 8:
            script_execute(scr, arr[0], arr[1], arr[2], arr[3], arr[4], arr[5], arr[6], arr[7]);
            break;
        case 9:
            script_execute(scr, arr[0], arr[1], arr[2], arr[3], arr[4], arr[5], arr[6], arr[7], arr[8]);
            break;
    }
}