// Including the files such as transaction, generator, driver, monitor, scoreboard
`include "dff_tran.sv"
`include "dff_gen.sv"
`include "dff_drv.sv"
`include "dff_mon.sv"
`include "dff_scrb.sv"

class environment;
  generator gen;
  driver drv;
  monitor mon;
  scoreboard scrb;

  mailbox gen2drv;
  mailbox gen2scr;
  mailbox mon2scr;

  virtual dff_if vif;

  // Constructor
  function new(virtual dff_if vif);
    gen2drv = new();
    gen2scr = new();
    mon2scr = new();

    gen = new(gen2drv, gen2scr);
    drv = new(gen2drv, vif);
    mon = new(mon2scr, vif);
    scrb = new(gen2scr, mon2scr, vif); // Pass virtual interface to scoreboard

    this.vif = vif;
    drv.vif = vif;
    mon.vif = vif;
  endfunction

  // Test Task
  task test();
    fork
      gen.run();
      drv.run();
      mon.run();
      scrb.run();
    join_any
  endtask

  // Run Task
  task run();
    test();
  endtask
endclass
