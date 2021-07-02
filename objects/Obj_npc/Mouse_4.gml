/// @description Insert description here
// You can write your code in this editor

wlog_create(Obj_wokialog);
wlog_add_text("안녕?@p@n오랜만이야..@p@n내일 비옴.");
wlog_set_sequence(true);
wlog_set_focus(true);
wlog_add_event(Obj_event_select);
wlog_set_property_event(["어쩌라고","비안옴","오감사"]);
wlog_add_if_link(0);
wlog_add_text("왜 화냄??@p@s0@q");
wlog_set_pscript(0,wlog_user_event,0,id);
wlog_add_elif_link(1);
wlog_add_text("헐 감사@p@s0@q");
wlog_set_pscript(0,wlog_user_event,1,id);
wlog_add_elif_link(2);
wlog_add_text("고마워하셈@p@s0@q");
wlog_set_pscript(0,wlog_user_event,2,id);
wlog_add_end();	