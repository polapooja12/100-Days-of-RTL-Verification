`include "sipo_transaction.sv"
`include "sipo_generator.sv"
`include "sipo_driver.sv"
`include "sipo_monitor.sv"
`include "sipo_scoreboard.sv"

class sipo_environment;
    sipo_generator gen; 
    sipo_driver drv; 
    sipo_monitor mon; 
    sipo_scoreboard scrb;

    mailbox gen2drv; 
    mailbox gen2scr; 
    mailbox mon2scr;

    virtual sipo_inf vif;

    function new(virtual sipo_inf vif);
        gen2drv = new(); 
        gen2scr = new(); 
        mon2scr = new();

        gen = new(gen2drv, gen2scr); 
        drv = new(gen2drv, vif); 
        mon = new(mon2scr, vif); 
        scrb = new(gen2scr, mon2scr, vif); // Pass `vif` as the third argument here

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

    task synchronize_clock();
        @(posedge vif.clk); // Ensure that operations align with the clock edge
    endtask

endclass
