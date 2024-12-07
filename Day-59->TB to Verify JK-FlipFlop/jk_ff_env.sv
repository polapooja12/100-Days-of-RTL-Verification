// Including the files such as transaction, generator, driver, monitor, scoreboard
`include "jk_ff_tran.sv"
`include "jk_ff_gen.sv"
`include "jk_ff_drv.sv"
`include "jk_ff_mon.sv"
`include "jk_ff_scrb.sv"

class environment;
    generator gen;
    driver drv;
    monitor mon;
    scoreboard scrb;

    mailbox gen2drv;
    mailbox gen2scr;
    mailbox mon2scr;

    virtual jk_ff_if vif;

    function new(virtual jk_ff_if vif);
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
