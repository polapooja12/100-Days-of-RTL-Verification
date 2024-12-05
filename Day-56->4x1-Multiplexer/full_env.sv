`include "mux_tran.sv"
`include "mux_gen.sv"
`include "mux_drv.sv"
`include "mux_mon.sv"
`include "mux_scrb.sv"


class environment; // Class for the test environment
    generator gen; // Instance of generator
    driver drv; // Instance of driver
    monitor mon; // Instance of monitor
    scoreboard scrb; // Instance of scoreboard

    mailbox gen2drv; // Mailbox connected to driver
    mailbox gen2scr; // Mailbox connected to scoreboard
    mailbox mon2scr; // Mailbox connected to scoreboard

    virtual full_inf vif; // Virtual interface handle

    // Constructor
  function new(virtual full_inf vif);
        gen2drv = new();
        gen2scr = new();
        mon2scr = new();

        gen = new(gen2drv, gen2scr);
        drv = new(gen2drv, vif);
        mon = new(mon2scr, vif);
        scrb = new(gen2scr, mon2scr);

        this.vif = vif; // Assign the virtual interface
        drv.vif = vif; // Assign the virtual interface to driver
        mon.vif = vif; // Assign the virtual interface to monitor
    endfunction

    // Test task to run all components
    task test();
        fork
            gen.run();
            drv.run();
            mon.run();
            scrb.run();
        join_any
    endtask

    // Run task to start the test
    task run();
        test();
    endtask
endclass
