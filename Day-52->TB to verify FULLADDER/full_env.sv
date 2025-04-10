class environment;
generator gen;
driver drv;
monitor mon;
scoreboard scrb;

mailbox gen2drv;
mailbox gen2scr;
mailbox mon2scr;

virtual add_inf vif;

function new(virtual add_inf vif);
gen2drv = new();
gen2scr = new();
mon2scr = new();

gen = new(gen2drv,gen2scr);
drv = new(gen2drv,vif);
mon = new(mon2scr,vif);
scrb = new(gen2scr,mon2scr);

this.vif = vif;
drv.vif = vif;
mon.vif = vif;
endfunction

task test();

fork
gen.run();
drv.run();
mon.run();
scrb.run();
join_any
endtask

task run();
test();
endtask
endclass
