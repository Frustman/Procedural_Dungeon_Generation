/// @function Scr_SM_default_init()
/// @function Scr_SM_init(_state)
/// @function Scr_SM_create(_state_name, _script)
/// @function Scr_SM_clean()
/// @function Scr_SM_switch(_script, _push)
/// @function Scr_SM_switch_previous()
/// @function Scr_SM_update()
/// @function Scr_SM_execute()

function Scr_SM_default_init(){
	state			= noone;
	state_next		= state;
	state_name		= "Unknown";
	state_timer		= 0;
	state_map		= ds_map_create();
	state_stack		= ds_stack_create();
	state_new		= true;
	state_var[0]	= 0;
}

function Scr_SM_init(_state){
	if(is_real(_state)){
	    state=_state;
	    state_name="Unknown (Use the name to switch next time)";
	} else {
	    state=ds_map_find_value(state_map,argument[0]);
	    state_name=argument[0];
	}    
	state_next=state;
	ds_stack_push(state_stack,state);
	state_new=true;
}


function Scr_SM_create(_state_name, _script){
	ds_map_replace(state_map, _state_name, _script);
}

function Scr_SM_clean(){
	ds_map_destroy(state_map);
	ds_stack_destroy(state_stack);
}

function Scr_SM_switch(_script, _push){
	var __push = true;
	if(argument_count > 1)
	  __push = argument[1];
  
	if(is_real(argument[0])) { //you passed a specific script, set it as our next state.
	  state_next=argument[0];
	  state_name="Unknown (Use the name to switch next time)";
	} else {   //you passed the name of a state, let's try and find it.
	  if(ds_map_exists(state_map, argument[0])){
	    state_next=ds_map_find_value(state_map,argument[0]);
	    state_name=argument[0]; 
	  } else {
	    show_debug_message("Tried to switch to a non-existent state.  Moving to first state.")
	    state_next=ds_map_find_first(state_map);
	    state_name="Unknown (Tried to switch to a non-existant state)";
	  }
	}
	if(__push) 
	  ds_stack_push(state_stack,state_next);
}


function Scr_SM_switch_previous(){
	ds_stack_pop(state_stack);
	var _state=ds_stack_top(state_stack);
	state_switch(_state,false);
}

function Scr_SM_update(){
	if(state_next != state){
	  state = state_next;
	  state_timer = 0;
	  state_new = true;
	} else {
	  state_timer++;
	  state_new = false;
	}
}


function Scr_SM_execute(){
	if(script_exists(state)) script_execute(state)
	else state_switch(ds_map_find_first(state_map));
}