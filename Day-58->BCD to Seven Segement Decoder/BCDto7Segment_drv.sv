class driver;
  mailbox gen2drv;  // Mailbox connected to generator
  transaction tr;   // Transaction handle
  virtual BCDto7Segment_inf vif;  // Virtual interface handle

  function new(mailbox gen2drv, virtual BCDto7Segment_inf vif);
    this.gen2drv = gen2drv;
    this.vif = vif;
  endfunction

  task run();
    forever begin
      tr = new();
      gen2drv.get(tr);  // Get transaction from generator
      vif.bcd <= tr.bcd;  // Drive BCD input to DUT
      #1;  // Wait for a time delay
      tr.seg = vif.seg;  // Capture the output
      tr.print("DRIVER");
    end
  endtask
endclass
