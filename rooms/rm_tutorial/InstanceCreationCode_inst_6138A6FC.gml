function npc1_dialog_1(){
	with(Obj_npc){
		if(!instance_exists(Obj_wokialog)){
			wlog_create(Obj_wokialog);
			wlog_add_text("잠깐!@p@n너희들 일로 와봐.");
			wlog_set_sequence(true);
			wlog_set_focus(true);
			wlog_add_event(Obj_event_select);
			wlog_set_property_event(["알았어","싫어"]);
			wlog_add_if_link(0);
			wlog_add_text("@s0@q");
			wlog_set_pscript(0, Scr_CutScene_end_action);
			wlog_add_elif_link(1);
			wlog_add_text("싫음 말구.@p@s0@q");
			wlog_set_pscript(0, Scr_CutScene_end_action);
			wlog_add_end();
		}
	}
};

function npc1_dialog_2(){
	with(Obj_npc){
		if(!instance_exists(Obj_wokialog)){
			wlog_create(Obj_wokialog);
			wlog_add_text("너희..@n어디서 본 것 같은데?");
			wlog_set_sequence(true);
			wlog_set_focus(true);
			wlog_add_event(Obj_event_select);
			wlog_set_property_event(["맞아","아니야"]);
			wlog_add_if_link(0);
			wlog_add_text("역시..@n잘가~~@p@s0@q");
			wlog_set_pscript(0, Scr_CutScene_end_action);
			wlog_add_elif_link(1);
			wlog_add_text("아님 말구.@p@s0@q");
			wlog_set_pscript(0, Scr_CutScene_end_action);
			wlog_add_end();
		}
	}
};
t_cutscene_info = [
	[Scr_CutScene_object_change_state, Obj_girl, "MOVETOSTOP"],
	[Scr_CutScene_object_change_state, Obj_chr, "IDLE"],
	[npc1_dialog_1],
	[Scr_CutScene_object_change_state, Obj_girl, "MOVE"],
	[Scr_CutScene_object_change_state, Obj_chr, "MOVE"],
	[Scr_CutScene_objects_move,[Obj_chr,1850,1645,1.5,"IDLE"],[Obj_girl,1810,1649,1.5,"MOVETOSTOP"]],
	[Scr_CutScene_object_set_variable, Obj_chr, "image_xscale", -1],
	[Scr_CutScene_object_set_variable, Obj_girl, "image_xscale", -1],
	[npc1_dialog_2]
];