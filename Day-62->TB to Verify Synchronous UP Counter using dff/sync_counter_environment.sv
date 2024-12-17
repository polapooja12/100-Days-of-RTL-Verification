// sync_counter_environment.sv
`include "sync_counter_transaction.sv"
`include "sync_counter_generator.sv"
`include "sync_counter_driver.sv"
`include "sync_counter_monitor.sv"
`include "sync_counter_scoreboard.sv"

class sync_counter_environment;
    sync_counter_generator gen; 
    sync_counter_driver drv; 
    sync_counter_monitor mon; 
    sync_counter_scoreboard scrb;

    mailbox gen2drv; 
    mailbox gen2scr; 
    mailbox mon2scr;

    virtual sync_counter_inf vif;

    function new(virtual sync_counter_inf vif);
        gen2drv = new(); 
        gen2scr = new(); 
        mon2scr = new();

        gen = new(gen2drv, gen2scr); 
        drv = new(gen2drv, vif); 
        mon = new(mon2scr, vif); 
        scrb = new(gen2scr, mon2scr);

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
