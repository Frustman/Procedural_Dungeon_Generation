function npc1_dialog_1(){
	with(Obj_npc){
		if(!instance_exists(Obj_wokialog)){
			wlog_create(Obj_wokialog);
			wlog_add_text("안녕?@p@n오랜만이야..@p@n내일 비옴.");
			wlog_set_sequence(true);
			wlog_set_focus(true);
			wlog_add_event(Obj_event_select);
			wlog_set_property_event(["어쩌라고","비안옴","오감사"]);
			wlog_add_if_link(0);
			wlog_add_text("왜 화냄??");
			wlog_add_elif_link(1);
			wlog_add_text("헐 감사");
			wlog_add_elif_link(2);
			wlog_add_text("고마워하셈@s0");
			wlog_set_pscript(0, Scr_CutScene_end_action);
			wlog_add_end();
		}
	}
};
t_cutscene_info = [
	[Scr_CutScene_wait, 1],
	[npc1_dialog_1]
];