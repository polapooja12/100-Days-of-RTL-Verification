`include "clock_divider_transaction.sv"
`include "clock_divider_generator.sv"
`include "clock_divider_driver.sv"
`include "clock_divider_monitor.sv"
`include "clock_divider_scoreboard.sv"

class clock_divider_environment;
    clock_divider_generator gen;
    clock_divider_driver drv;
    clock_divider_monitor mon;
    clock_divider_scoreboard scrb;

    mailbox gen2drv, gen2scr, mon2scr;
    virtual clock_divider_inf vif;

    function new(virtual clock_divider_inf vif);
        gen2drv = new();
        gen2scr = new();
        mon2scr = new();

        gen = new(gen2drv, gen2scr);
        drv = new(gen2drv, vif);
        mon = new(mon2scr, vif);
        scrb = new(gen2scr, mon2scr);

        this.vif = vif;
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
