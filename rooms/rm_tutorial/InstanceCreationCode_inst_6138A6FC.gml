function npc1_dialog_1(){
	with(Obj_npc){
		if(!instance_exists(Obj_wokialog)){
			wlog_create(Obj_wokialog);
			wlog_add_text("잠깐!@p@n너희들 거기 멈춰봐.");
			wlog_set_sequence(true);
			wlog_set_focus(true);
			wlog_add_event(Obj_event_select);
			wlog_set_property_event(["알았어","싫어"]);
			wlog_add_if_link(0);
			wlog_add_text("잘했어.@p@n이제 가.@p@s0@q");
			wlog_set_pscript(0, Scr_CutScene_end_action);
			wlog_add_elif_link(1);
			wlog_add_text("싫음 말구.@p@s0@q");
			wlog_set_pscript(0, Scr_CutScene_end_action);
			wlog_add_end();
		}
	}
};
t_cutscene_info = [
	[npc1_dialog_1]
];