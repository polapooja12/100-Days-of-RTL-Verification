`include "rca_transaction.sv"
`include "rca_driver.sv"
`include "rca_generator.sv"
`include "rca_monitor.sv"
`include "rca_scoreboard.sv"
class environment;
    generator gen;
    driver drv;
    monitor mon;
    scoreboard scr;

    mailbox gen2drv, gen2scr, mon2scr;
    virtual rca_interface vif;

    function new(virtual rca_interface vif);
        gen2drv = new();
        gen2scr = new();
        mon2scr = new();

        gen = new(gen2drv, gen2scr);
        drv = new(gen2drv, vif);
        mon = new(mon2scr, vif);
        scr = new(gen2scr, mon2scr);

        this.vif = vif;
    endfunction

    task test();
        fork
            gen.run();
            drv.run();
            mon.run();
            scr.run();
        join_any
    endtask

    task run();
        test();
    endtask
endclass
