wlog_create(o_wokialog);

/*wlog_add_text("hp = @b0");
wlog_set_pvariable(0,"hp");
global.hp++;*/

wlog_add_if(1);
wlog_add_text("1장. ");
wlog_add_else();
wlog_add_text("2장. ");
wlog_add_end();

wlog_add_text("..내가 누구지? @d4내 이름은 프렌이고.. ~~~~~~~~test testet testestset se testsetsetsetsetse testestestsetset @d0stetsetset tsetsetstes testsetest 테스트 세트스 테스트 테스트 테스트테스트 테스 테스트 테스트");
wlog_add_text("{0/안녕하세요!/0} @c1테스트중@i0입니다.@c0@c0 @n__잘되네요!!__@n@p@a0@x@c2**너무** @p--잘된다!@s0--@c0@n~~~@n@p@l2엔터 두번.@v0@l0@n@c2@l2종@l1료@l0가나다라종료가나다라종료가나다라@n종료가나다라종료가나다라@n안녕하세요! 테스트중입니다. @c0@n잘되네요!!@n@p너무 잘된다!@n@n@p엔터 두번.");
wlog_set_psprite(0,s_emo,0);
wlog_set_psound(0,sd_test);
wlog_set_pscript(0,scr_effect);
wlog_set_pvalue(0,100);
wlog_set_peffect(0,effect.shake,[2]);
	
wlog_add_event(o_event_select);
wlog_set_property_event(["1번","2번","3번"]);

wlog_add_if_link(0);
wlog_add_text("1장. ");
wlog_add_elif_link(1);
wlog_add_text("2장. ");
wlog_add_elif_link(2);
wlog_add_text("3장. ");
wlog_add_end();

wlog_add_text("@l2다음장2. @l0@n@l6작은 글씨로 쭉쭉쭉~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~@l0@n@l4마@l2나@l0오@l2리@l4마@l2나@l0오@l2리@l0");