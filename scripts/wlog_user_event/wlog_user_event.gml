/// @function wlog_user_event(num, parent)
/// @arg num
function wlog_user_event(argument0, argument1){
	with(argument1){
		switch(argument0){
			case 0:
				event_perform(ev_other,ev_user0);
				break;
			case 1:
				event_perform(ev_other,ev_user1);
				break;
			case 2:
				event_perform(ev_other,ev_user2);
				break;
			case 3:
				event_perform(ev_other,ev_user3);
				break;
			case 4:
				event_perform(ev_other,ev_user4);
				break;
			case 5:
				event_perform(ev_other,ev_user5);
				break;
			case 6:
				event_perform(ev_other,ev_user6);
				break;
			case 7:
				event_perform(ev_other,ev_user7);
				break;
			case 8:
				event_perform(ev_other,ev_user8);
				break;
			case 9:
				event_perform(ev_other,ev_user9);
				break;
			case 10:
				event_perform(ev_other,ev_user10);
				break;
		}
	}
}