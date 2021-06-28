wlog_init();
global.hp=0;

wlog_create(o_wokialog);
wlog_add_text("휴식할까?");
wlog_add_event(o_event_select);
wlog_set_property_event(["응","아니"]);

wlog_add_if_link(0);
wlog_add_text("누가 쉬도록 할까?");
wlog_add_event(o_event_select);
wlog_set_property_event(["토끼","여우","둘 다"]);

wlog_add_if_link(0);
wlog_add_text("토끼가 잠들었다.. 그동안 뭐라도 할까...");
wlog_add_elif_link(1);
wlog_add_text("여우가 잠들었어! 시간이나 때워야지!");
wlog_add_elif_link(2);
wlog_add_text("네 시간이 지났다...");
wlog_add_end();

wlog_add_else();
wlog_add_text("뭐라도 할 게 있으면 미리미리 하도록 하자!"	);
wlog_add_end();
/*

[Command]
- @n: Enter
- @x: Remove text
- @p: Pause
- @i[0~9]: Sprite[sprite_index, image_index]
- @a[0~9]: Sound
- @s[0~9]: Script
- @v[0~9]: Value
- @d[0~9]: Speed / Global Property(0.5, 1, 1.5, 2)
- @c[0~9]: Color / Global Property
- @l[0~9]: Scale / Global Property
- __TEXT__: Underline
- --TEXT--: Strikethrough
- **TEXT**: Bold
- {0~9/TEXT/0~9} : Effect - Effect can be added in the wlog_draw() function

*/