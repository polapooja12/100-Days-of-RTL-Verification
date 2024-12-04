
`include "priority_encoder_tran.sv"
`include "priority_encoder_gen.sv"
`include "priority_encoder_drv.sv"
`include "priority_encoder_mon.sv"
`include "priority_encoder_scrb.sv"

class environment;
  generator gen;
  driver drv;
  monitor mon;
  scoreboard scrb;

  mailbox gen2drv;
  mailbox gen2scr;
  mailbox mon2scr;

  virtual priority_encoder_if vif;

  function new(virtual priority_encoder_if vif);
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
