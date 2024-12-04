`include "decoder_tran.sv"
`include "decoder_gen.sv"
`include "decoder_drv.sv"
`include "decoder_mon.sv"
`include "decoder_scrb.sv"

class environment; // Environment class
    generator gen; // Generator instance
    driver drv; // Driver instance
    monitor mon; // Monitor instance
    scoreboard scrb; // Scoreboard instance

    mailbox gen2drv; // Mailbox from generator to driver
    mailbox gen2scr; // Mailbox from generator to scoreboard
    mailbox mon2scr; // Mailbox from monitor to scoreboard

    virtual decoder_inf vif; // Virtual interface

    // Constructor
    function new(virtual decoder_inf vif);
        this.vif = vif; // Assign the virtual interface
        gen2drv = new(); // Create mailboxes
        gen2scr = new();
        mon2scr = new();

        // Instantiate the classes
        gen = new(gen2drv, gen2scr);
        drv = new(gen2drv, vif);
        mon = new(mon2scr, vif);
        scrb = new(gen2scr, mon2scr);
    endfunction

    // Test task to run all components
    task test();
        fork
            gen.run(); // Start the generator
            drv.run(); // Start the driver
            mon.run(); // Start the monitor
            scrb.run(); // Start the scoreboard
        join_any // Wait for any of the tasks to finish
    endtask

    // Run task to initiate the test
    task run();
        test(); // Call the test task
    endtask
endclass
